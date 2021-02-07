package com.ddomansky.pm;

import org.mapstruct.MapperConfig;
import org.mapstruct.ReportingPolicy;

public interface MapstructConfigs {

    @MapperConfig(unmappedTargetPolicy = ReportingPolicy.ERROR)
    interface DefaultMapperConfig {
    }

    /**
     * MapStruct mapper configuration causing the generated mapper implementation
     * to be marked as spring bean and thus eligible for other beans (e.g. repositories) injection.
     * <p>
     * Use with caution.
     */
    @MapperConfig(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.ERROR)
    interface SpringMapperConfig {
    }
}
