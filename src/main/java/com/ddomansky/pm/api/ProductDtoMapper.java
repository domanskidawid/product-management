package com.ddomansky.pm.api;

import com.ddomansky.pm.MapstructConfigs;
import com.ddomansky.pm.api.model.ProductDto;
import com.ddomansky.pm.api.model.ProductResponseDto;
import com.ddomansky.pm.domain.Product;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import org.springframework.data.domain.Page;

import java.util.stream.Collectors;

@Mapper(config = MapstructConfigs.DefaultMapperConfig.class)
public interface ProductDtoMapper {
    ProductDtoMapper productDtoMapper = Mappers.getMapper(ProductDtoMapper.class);

    default ProductResponseDto map(Page<Product> products) {
        return new ProductResponseDto()
                .totalPages(products.getTotalPages())
                .totalElements(products.getTotalElements())
                .items(products.stream()
                        .map(this::map)
                        .collect(Collectors.toList()));
    }

    @Mapping(target = "categoryId", source = "category.id")
    @Mapping(target = "categoryName", source = "category.categoryName")
    ProductDto map(Product product);
}
