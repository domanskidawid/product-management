package com.ddomansky.pm.domain;

import lombok.Builder;
import lombok.Data;

import java.time.Instant;

@Data
@Builder(toBuilder = true)
public class Product {
    Long id;
    String name;
    String description;
    ProductCategory category;
    Instant creationDate;
    Instant updateDate;
    Instant lastPurchasedDate;
}
