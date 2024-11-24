package com.example.data;

import com.example.model.Agency;
import com.example.model.Client;
import com.example.model.CreditCard;
import com.example.repository.AgencyRepository;
import com.example.repository.ClientRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class AgencyData {
   private Logger logger = LoggerFactory.getLogger(AgencyData.class);
   @Bean
   public CommandLineRunner initDatabase(AgencyRepository repository, ClientRepository clientRepository){
    return args -> {
        logger.info("Preloading: "+repository.save(
                new Agency("airbnb","admin","airbnb")
        ));
        CreditCard c1 = new CreditCard("123456789","2027");
        logger.info("Adding Client", clientRepository.save(new Client("MANSOUR Malik", "0657882408", "malik@gmail.com",c1)
        ));
    };
   }
}
