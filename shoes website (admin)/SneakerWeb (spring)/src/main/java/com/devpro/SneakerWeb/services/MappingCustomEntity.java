package com.devpro.SneakerWeb.services;

import com.devpro.SneakerWeb.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
