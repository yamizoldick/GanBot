import org.telegram.telegrambots.ApiContext;
import org.telegram.telegrambots.ApiContextInitializer;
import org.telegram.telegrambots.TelegramBotsApi;
import org.telegram.telegrambots.exceptions.TelegramApiRequestException;

public class Main {
    public static void main(String args[]) {
        ApiContextInitializer.init();
        TelegramBotsApi rojobot =new TelegramBotsApi();
        RojoBot bot= new RojoBot();
        //RojoBot conexion=new RojoBot();
        try {
            rojobot.registerBot(bot);
        }
        catch (TelegramApiRequestException e) {
            e.printStackTrace();
        }
    }
}
