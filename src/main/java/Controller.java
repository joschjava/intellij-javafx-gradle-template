import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Slider;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Controller {


    @FXML
    Slider slGain1;

    @FXML
    public void initialize() {
        slGain1.valueProperty().addListener(
                new ChangeListener<Number>() {

                    @Override
                    public void changed(ObservableValue<? extends Number> observableValue, Number oldValue, Number newValue) {
                        int volumeOld = oldValue.intValue();
                        int volumeNew = newValue.intValue();
                        System.out.println(volumeOld + " " + volumeNew);
                        if (volumeNew != volumeOld) {

                            Process p = null;
                            try {
                                String command = "pactl set-sink-input-volume 0 " + volumeNew + "%";
//                                String command = "pactl set-sink-volume 0 " + volumeNew + "%";
//                                String command = "sh /home/jonas/Desktop/worked.sh";
                                System.out.println(command);
                                p = Runtime.getRuntime().exec(				new String[] {
                                        "/bin/bash",
                                        "-c",
                                        command });

                                BufferedReader br = new BufferedReader(
                                        new InputStreamReader(p.getInputStream()));
                                String s;
                                while ((s = br.readLine()) != null)
                                    System.out.println("line: " + s);
                                p.waitFor();
                                System.out.println("Ended");
                            } catch (IOException | InterruptedException e) {
                                e.printStackTrace();
                            }

                        }
                    }
                });
    }

}
