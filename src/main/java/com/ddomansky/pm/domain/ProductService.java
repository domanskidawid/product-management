package com.ddomansky.pm.domain;

import com.ddomansky.pm.persistence.ProductEntity;
import com.ddomansky.pm.persistence.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Optional;

import static com.ddomansky.pm.domain.ProductMapper.productMapper;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {

    private final ProductRepository productRepository;

    public Page<Product> findProducts(SearchCriteria searchCriteria) {
        log.info("Finding products by {}", searchCriteria);
        final PageRequest pageRequest = Optional.ofNullable(searchCriteria.getSort())
                .map(it -> PageRequest.of(
                        searchCriteria.getPageNo(),
                        searchCriteria.getPageSize(),
                        Sort.by(resolveDirection(it), it.getFieldName()))
                )
                .orElse(PageRequest.of(searchCriteria.getPageNo(), searchCriteria.getPageSize()));
        final Page<ProductEntity> productsPage = productRepository.findAll(pageRequest);
        return productsPage.map(productMapper::map);
    }

    private static Sort.Direction resolveDirection(SearchCriteria.Sort sort) {
        return Sort.Direction.ASC.name().equals(sort.getDirection().name()) ? Sort.Direction.ASC : Sort.Direction.DESC;
    }
}
