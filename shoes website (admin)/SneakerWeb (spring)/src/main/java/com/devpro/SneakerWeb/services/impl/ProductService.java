package com.devpro.SneakerWeb.services.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.SneakerWeb.dto.HomeProductsDTO;
import com.devpro.SneakerWeb.dto.ProductSearch;
import com.devpro.SneakerWeb.model.Product;
import com.devpro.SneakerWeb.model.ProductImages;
import com.devpro.SneakerWeb.services.BaseService;
import com.devpro.SneakerWeb.services.PagerData;
import com.github.slugify.Slugify;

import antlr.StringUtils;

/**
 * tạo một bean service, các bean được tạo dùng để thao tác với entities
 */
@Service
public class ProductService extends BaseService<Product> {

	@Autowired
	ProductImagesService productImagesService;

	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/**
	 * tạo tên file upload
	 */
	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}

	/**
	 * thêm mới sản phẩm
	 */
	@Transactional
	public Product addProduct(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {
		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.

			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			System.out.println("avatar: " + fileName);
			// tạo đường dẫn tới file chứa avatar
			String pathToImages = "D:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToImages));

			product.setLocation("product/avatar/" + fileName);
		}
		// kiểm tra có đẩy pictures lên không
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên

			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());

				// lưu các pictures vào database
				pic.transferTo(new File("D:/upload/product/pictures/" + fileName));

				ProductImages productImages = new ProductImages();
				productImages.setPath("product/pictures/" + fileName);
				productImages.setTitle(fileName);
				System.out.println("pictures: " + fileName);
				product.addProductImages(productImages);
				// tạo mới 1 bản ghi product_images
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
		Slugify slugify = new Slugify();
		product.setSeo(slugify.slugify(product.getName() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(product);
	}

	/**
	 * chỉnh sửa sản phẩm
	 * 
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional
	public Product editProduct(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {
		// lấy thông tin cũ của product theo id
		Product productInDb = super.getById(product.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("D:/upload/" + productInDb.getLocation()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("D:/upload/product/avatar/" + fileName));
			product.setLocation("product/avatar/" + fileName);
		} else {
			// sử dụng lại avartar cũ
			product.setLocation(productInDb.getLocation());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (ProductImages opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File("D:/upload/" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// update pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());

				pic.transferTo(new File("D:/upload/product/pictures/" + fileName));

				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);

				product.addProductImages(pi);
			}
		}

		// tạo seo
		Slugify slugify = new Slugify();
		product.setSeo(slugify.slugify(product.getName() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(product);
	}

	public PagerData<Product> searchProduct(ProductSearch searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM product p WHERE 1=1  AND status !=0";

		if (searchModel != null) {
			// tìm kiếm theo tên
			if (!org.springframework.util.StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.name like '%" + searchModel.getKeyword() + "%')";
			}
			
			// tìm theo seo
			if (!org.springframework.util.StringUtils.isEmpty(searchModel.getSeo())) {
				sql += " and seo = '" + searchModel.getSeo() + "'";
			}
			
			// kiểm tra orderBy
		}

		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}

	public PagerData<Product> productPager(HomeProductsDTO product) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM product WHERE 1=1 AND status != 0";

		return getEntitiesByNativeSQL(sql, product.getCurrentPage());
	}
}
