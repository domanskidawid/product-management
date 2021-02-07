package com.ddomansky.pm.fixtures;

import com.ddomansky.pm.persistence.ProductEntity;

import java.time.Instant;

public class ProductFixtures {
    public static ProductEntity.ProductEntityBuilder someProduct() {
        final Instant now = Instant.now();
        return ProductEntity.builder()
                .name("hammer")
                .description("blue hammer")
                .creationDate(now)
                .updateDate(now)
                .lastPurchasedDate(now);
    }
}
