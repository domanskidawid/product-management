package com.ddomansky.pm.api;

import com.ddomansky.pm.api.model.InternalServerErrorResponseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
@Component
public class GlobalErrorHandler {

    @ExceptionHandler({Exception.class})
    public ResponseEntity<InternalServerErrorResponseDto> onException(Exception e) {
        log.error("Unexpected exception has occurred. This incident should be reported", e);
        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .contentType(MediaType.APPLICATION_JSON)
                .body(
                        new InternalServerErrorResponseDto()
                                .errorMessage(e.getMessage())
                                .errorCode("errors.internal-server-error")
                );
    }
}
