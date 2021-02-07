package com.ddomansky.pm;

import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;
import liquibase.exception.LiquibaseException;
import liquibase.resource.ClassLoaderResourceAccessor;
import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.util.TestPropertyValues;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.testcontainers.containers.PostgreSQLContainer;

import java.sql.Connection;

@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ContextConfiguration(initializers = ProductManagementIT.Initializer.class)
@TestExecutionListeners(listeners = TestEventsExecutionListener.class, mergeMode = TestExecutionListeners.MergeMode.MERGE_WITH_DEFAULTS)
@AutoConfigureMockMvc
public abstract class ProductManagementIT {

    private static final String LIQUIBASE_CHANGELOG_MASTER_PATH = "liquibase/changelog/changelog-master.xml";
    private static final String LIQUIBASE_CONTEXT = "test";

    private static final String DATABASE_NAME = "postgresql:10.4";
    private static final String POSTGRES_IMAGE = "postgres:10.4";

    private static final PostgreSQLContainer postgres = new PostgreSQLContainer(POSTGRES_IMAGE);

    static {
        postgres.start();
    }

    public static void postgresInitFunction(Connection connection) throws LiquibaseException {
        final Database database = DatabaseFactory.getInstance().findCorrectDatabaseImplementation(new JdbcConnection(connection));
        final Liquibase liquibase = new Liquibase(LIQUIBASE_CHANGELOG_MASTER_PATH, new ClassLoaderResourceAccessor(), database);
        liquibase.update(LIQUIBASE_CONTEXT);
    }

    public static class Initializer implements ApplicationContextInitializer<ConfigurableApplicationContext> {
        @Override
        public void initialize(@NotNull ConfigurableApplicationContext configurableApplicationContext) {
            TestPropertyValues values = TestPropertyValues.of(
                    String.format("spring.datasource.url=jdbc:tc:%s://hostname/databasename?TC_INITFUNCTION=%s::postgresInitFunction",
                            DATABASE_NAME, getParentClassName()),
                    String.format("spring.datasource.username=%s", postgres.getUsername()),
                    String.format("spring.datasource.password=%s", postgres.getPassword())
            );
            values.applyTo(configurableApplicationContext);
        }

        private String getParentClassName() {
            return this.getClass().getName().split("\\$")[0];
        }
    }
}
