package com.ddomansky.pm.fixtures;

import com.ddomansky.pm.persistence.ProductCategoryEntity;

public class ProductCategoryFixtures {
    public static ProductCategoryEntity.ProductCategoryEntityBuilder someProductCategoryEntity(){
        return ProductCategoryEntity.builder().categoryName("tools");
    }
}
