package com.ddomansky.pm.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class SearchCriteria {
    Integer pageNo;
    Integer pageSize;
    Sort sort;

    @Data
    @Builder(toBuilder = true)
    public static class Sort {
        String fieldName;
        Direction direction;

        public enum Direction {
            ASC, DESC
        }
    }


}
