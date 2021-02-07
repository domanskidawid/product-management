package com.ddomansky.pm;

import org.springframework.test.context.TestContext;
import org.springframework.test.context.TestExecutionListener;

public class TestEventsExecutionListener implements TestExecutionListener {

    @Override
    public void afterTestMethod(TestContext testContext) {
        testContext.getApplicationContext().publishEvent(new TestFinishedEvent());
    }

    public static class TestFinishedEvent {}
}
