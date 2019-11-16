import javafx.fxml.FXML;
import javafx.scene.control.Button;

public class Controller {


    @FXML
    Button testButton;

    @FXML
    public void initialize() {
        testButton.setOnAction(event -> {
            System.out.println("Button clicked");
        });
    }

}
