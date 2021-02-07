package com.ddomansky.pm.api;

import com.ddomansky.pm.ProductManagementIT;
import com.ddomansky.pm.persistence.ProductCategoryEntity;
import com.ddomansky.pm.persistence.ProductCategoryRepository;
import com.ddomansky.pm.persistence.ProductRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

import java.util.List;

import static com.ddomansky.pm.fixtures.ProductFixtures.someProduct;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

class ProductControllerTestApi extends ProductManagementIT {
    @Autowired
    private MockMvc mvc;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    @BeforeEach
    void reset() {
        productRepository.deleteAll();
    }

    @Test
    void testFindProducts() throws Exception {
        //given
        final ProductCategoryEntity toolsCategory = productCategoryRepository.save(ProductCategoryEntity.builder()
                .categoryName("Tools")
                .build()
        );

        productRepository.saveAll(
                List.of(
                        someProduct().name("drill").description("blue drill").category(toolsCategory).build(),
                        someProduct().name("jigsaw").description("blue jigsaw").category(toolsCategory).build(),
                        someProduct().name("glue").description("blue glue").category(toolsCategory).build(),
                        someProduct().name("axe").description("blue axe").category(toolsCategory).build(),
                        someProduct().name("hammer").description("blue hammer").category(toolsCategory).build()
                )
        );

        //when & then
        mvc.perform(get("/api/v1/products?pageNo=0&pageSize=2&sort=name&direction=ASC"))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.items").isArray())
                .andExpect(jsonPath("$.totalPages").value(3))
                .andExpect(jsonPath("$.totalElements").value(5))
                .andExpect(jsonPath("$.items[0].name").value("axe"))
                .andExpect(jsonPath("$.items[1].name").value("drill"))
                .andExpect(jsonPath("$.items[1].description").value("blue drill"));
    }
}
