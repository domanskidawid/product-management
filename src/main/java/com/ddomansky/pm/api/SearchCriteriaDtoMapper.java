package com.ddomansky.pm.api;

import com.ddomansky.pm.MapstructConfigs;
import com.ddomansky.pm.api.model.DirectionDto;
import com.ddomansky.pm.domain.SearchCriteria;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.Optional;

@Mapper(config = MapstructConfigs.DefaultMapperConfig.class)
public interface SearchCriteriaDtoMapper {
    SearchCriteriaDtoMapper searchCriteriaDtoMapper = Mappers.getMapper(SearchCriteriaDtoMapper.class);

    default SearchCriteria map(Integer pageNo,
                               Integer pageSize,
                               String fieldName,
                               DirectionDto direction) {

        return SearchCriteria.builder()
                .pageNo(Optional.ofNullable(pageNo).orElse(0))
                .pageSize(Optional.ofNullable(pageSize).orElse(20))
                .sort(sort(fieldName, direction))
                .build();
    }

    SearchCriteria.Sort sort(String fieldName, DirectionDto direction);
}
