import com.intuit.karate.core.MockServer;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

class APIRunner {

    private static MockServer mock;

    @BeforeAll
    static void startMock() {
        mock = MockServer
                .feature("classpath:mocks/reqres-mock.feature")
                .http(0)
                .build();
        System.setProperty("karate.mock.port", String.valueOf(mock.getPort()));
        System.out.println("ReqRes mock started on port " + mock.getPort());
    }

    @AfterAll
    static void stopMock() {
        if (mock != null) mock.stop();
    }

    @Karate.Test
    Karate run() {
        String karateOptions = System.getProperty("karate.options");
        System.out.println(karateOptions);
        if (karateOptions != null && !karateOptions.isEmpty()) {
            return Karate.run(karateOptions.split(" "));
        } else {
            return Karate.run().relativeTo(getClass());
        }
    }
}
