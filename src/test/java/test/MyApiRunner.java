package test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import static org.junit.jupiter.api.Assertions.assertEquals;

class MyApiRunner {

    private static final String SERVER_URL = "http://localhost:9826";

    private static void waitForServer() {
        int maxAttempts = 10; // retries
        int attempt = 0;
        while (attempt < maxAttempts) {
            attempt++;
            try {
                HttpURLConnection connection = (HttpURLConnection) new URL(SERVER_URL).openConnection();
                connection.setRequestMethod("GET");
                connection.setConnectTimeout(2000);
                connection.connect();
                if (connection.getResponseCode() == 200) {
                    System.out.println("Server is up after " + attempt + " attempt(s).");
                    return;
                }
            } catch (IOException ignored) {}
            System.out.println("⏳ Waiting for server... Attempt " + attempt);
            try {
                Thread.sleep(2000);
            } catch (InterruptedException ignored) {}
        }
        throw new RuntimeException("Server at " + SERVER_URL + " did not start in time.");
    }

    @Karate.Test
    Karate testAll() {
        waitForServer(); // ensure server is running

        Results results = Runner.path(System.getProperty("FeaturePath"))
                .outputCucumberJson(true)
                .parallel(1);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
        return Karate.run(System.getProperty("FeaturePath"));
    }
}
