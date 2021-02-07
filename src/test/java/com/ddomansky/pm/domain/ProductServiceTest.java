package com.ddomansky.pm.domain;

import com.ddomansky.pm.fixtures.ProductFixtures;
import com.ddomansky.pm.persistence.ProductEntity;
import com.ddomansky.pm.persistence.ProductRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;


@ExtendWith(MockitoExtension.class)
class ProductServiceTest {

    @InjectMocks
    private ProductService productService;

    @Mock
    private ProductRepository productRepository;

    @Test
    void testFindProducts() {
        //given
        final SearchCriteria searchCriteria = SearchCriteria.builder()
                .sort(SearchCriteria.Sort.builder()
                        .direction(SearchCriteria.Sort.Direction.ASC)
                        .fieldName("name").build())
                .pageNo(0)
                .pageSize(2)
                .build();

        final PageImpl<ProductEntity> productEntityPage = new PageImpl<>(
                List.of(ProductFixtures.someProduct().build())
        );

        Mockito.when(productRepository.findAll(any(Pageable.class)))
                .thenReturn(productEntityPage);

        //when
        final Page<Product> products = productService.findProducts(searchCriteria);

        //then
        final Product product = products.stream().findFirst().get();
        assertThat(product.getName()).isEqualTo("hammer");
        assertThat(product.getDescription()).isEqualTo("blue hammer");
    }
}
