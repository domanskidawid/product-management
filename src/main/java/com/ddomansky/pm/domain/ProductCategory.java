package com.ddomansky.pm.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class ProductCategory {
    Long id;
    String categoryName;
}
