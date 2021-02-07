package com.ddomansky.pm.domain;

import com.ddomansky.pm.MapstructConfigs;
import com.ddomansky.pm.persistence.ProductCategoryEntity;
import com.ddomansky.pm.persistence.ProductEntity;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper(config = MapstructConfigs.DefaultMapperConfig.class)
public interface ProductMapper {
    ProductMapper productMapper = Mappers.getMapper(ProductMapper.class);

    Product map(ProductEntity productEntity);

    ProductCategory map(ProductCategoryEntity productEntity);

}
