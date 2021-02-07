package com.ddomansky.pm.api;

import com.ddomansky.pm.api.model.DirectionDto;
import com.ddomansky.pm.api.model.ProductResponseDto;
import com.ddomansky.pm.domain.Product;
import com.ddomansky.pm.domain.ProductService;
import com.ddomansky.pm.domain.SearchCriteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;

import static com.ddomansky.pm.api.ProductDtoMapper.productDtoMapper;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ProductController implements ProductsApiDelegate {

    private final ProductService productService;

    @Override
    public ResponseEntity<ProductResponseDto> findProducts(@Nullable Integer pageNo,
                                                          @Nullable Integer pageSize,
                                                          @Nullable String sort,
                                                          @Nullable DirectionDto direction) {
        final SearchCriteria searchCriteria = SearchCriteriaDtoMapper.searchCriteriaDtoMapper.map(pageNo,
                pageSize,
                sort,
                direction);
        final Page<Product> products = productService.findProducts(searchCriteria);
        return ResponseEntity.ok(productDtoMapper.map(products));
    }
}
