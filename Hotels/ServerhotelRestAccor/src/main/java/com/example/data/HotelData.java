package com.example.data;

import ch.qos.logback.core.net.server.Client;
import com.example.model.Adresse;
import com.example.model.Agency;
import com.example.model.Hotel;
import com.example.repository.HotelRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class HotelData {
    private Logger logger = LoggerFactory.getLogger(HotelData.class);
 /*    @Bean
public CommandLineRunner initDatabase(HotelRepository repository){

        Adresse adr1 = new Adresse("France", "Paris", "42 rue des Petites Ecuries","48.874066806308484, 2.350175541692411");
        Adresse adr2 = new Adresse("France", "Paris", "10 Rue Agrippa d'Aubigné ","48.850137808400966, 2.362392226984488");
    return args -> {
        logger.info("Preloading: "+repository.save(new Hotel("Mercure Paris Opera Grands Boulevards Hotel",4,100,adr1)
        ));
        logger.info("Preloading: "+repository.save(new Hotel("SO/ PARIS Hotel",5,100,adr2)
        ));
    };

}*/
}
