package com.devpro.SneakerWeb.services.impl;

import com.devpro.SneakerWeb.model.Voucher;
import com.devpro.SneakerWeb.services.BaseService;
import com.devpro.SneakerWeb.services.PagerData;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VoucherService extends BaseService<Voucher> {

    @Override
    protected Class<Voucher> clazz() {
        // TODO Auto-generated method stub
        return Voucher.class;
    }

    @Transactional
    public Voucher addVoucher(Voucher voucher) {
        return super.saveOrUpdate(voucher);
    }

    @Transactional
    public Voucher editVoucher(Voucher voucher) {
        return super.saveOrUpdate(voucher);
    }

    public PagerData<Voucher> searchVoucher() {
        String sql = "SELECT * FROM voucher";
        return getEntitiesByNativeSQL(sql, 1);
    }

}
