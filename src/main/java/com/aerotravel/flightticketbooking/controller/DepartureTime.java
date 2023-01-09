package com.aerotravel.flightticketbooking.controller;


import com.google.maps.DistanceMatrixApi;
import com.google.maps.DistanceMatrixApiRequest;
import com.google.maps.GeoApiContext;
import com.google.maps.errors.ApiException;
import com.google.maps.model.DistanceMatrix;
import com.google.maps.model.TrafficModel;
import com.google.maps.model.TravelMode;
import java.io.IOException;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class DepartureTime {

    public static DistanceMatrix setupAPI(String origin,String destination,Instant departuretime) throws ApiException, InterruptedException, IOException{
        GeoApiContext context = new GeoApiContext.Builder().apiKey("AIzaSyDmRKaIKB7miLz_BDES9Nt8zGAnbpXifCo").build();
        DistanceMatrixApiRequest request = DistanceMatrixApi.newRequest(context);
        request.origins(origin);
        request.destinations(destination);
        request.mode(TravelMode.DRIVING);

//        Instant cur = Instant.parse("2023-01-10T10:00:00Z");
        request.departureTime(departuretime);
        request.trafficModel(TrafficModel.BEST_GUESS);

        DistanceMatrix response = request.await();
        return response;
    }

    public static double distanceInKM(String origin,String destination,Instant departuretime) throws ApiException, InterruptedException, IOException{
        DistanceMatrix response = setupAPI(origin,destination,departuretime);
        double distanceInMeters = response.rows[0].elements[0].distance.inMeters;
        double distanceInKilometers = distanceInMeters / 1000.0;
        return distanceInKilometers;
    }

    public static long durationInMinutes(String origin,String destination, Instant departuretime) throws ApiException, InterruptedException, IOException{
        DistanceMatrix response = setupAPI(origin,destination,departuretime);
        long duration = response.rows[0].elements[0].duration.inSeconds / 60;
        return duration;
    }

    public static String suggestTime(String departuretime, long duration){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime departureTime = LocalDateTime.parse(departuretime, formatter);
        Duration durations = Duration.ofMinutes(duration);
        LocalDateTime suggestTime = departureTime.minus(durations);
        String suggestTimeString = suggestTime.format(formatter);
        return suggestTimeString;
    }

//    public static void main(String[] args) throws ApiException, InterruptedException, IOException {
////        String origin = "Taman Danau Desa, 58100 Kuala Lumpur, Federal Territory of Kuala Lumpur";
////        String destination = "Kuala Lumpur International Airport";
//
//        String origin = "Rafflesia Condominium Sentul";
//        String destination = "Fakulti Sains Komputer dan Teknologi Maklumat, University of Malaya, 50603 Kuala Lumpur, Federal Territory of Kuala Lumpur";
////        String departuretimeStr = "2023-01-10 10:00:00";
//        Instant departuretime = Instant.parse("2023-01-10T10:00:00Z");
//
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss").withZone(ZoneId.of("Europe/Paris"));;
//        String instantStr = formatter.format(departuretime);
//
//        double distance = distanceInKM(origin,destination,departuretime);
//        long duration = durationInMinutes(origin,destination,departuretime); // destination + check_in
//        String leavetime = suggestTime(instantStr, duration+30) ;
//
//        System.out.println("Your Location: " + origin
//                + "\nDestination: " + destination
//                + "\nDistance(km): " + distance
//                + "\nDuration (minutes): "+ duration
//                + "\nDeparture time: "+ instantStr
//                + "\nSuggestion time to leave from your place: "+leavetime);
//
//    }

    public static String[] getDistance(String origin, String destination, Instant departuretime) throws ApiException, InterruptedException, IOException{

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss").withZone(ZoneId.of("GMT"));
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss").ISO_LOCAL_DATE_TIME.withZone(ZoneId.from(ZoneOffset.UTC));
        String instantStr = formatter.format(departuretime);

        double distance = distanceInKM(origin,destination,departuretime);
        long duration = durationInMinutes(origin,destination,departuretime); // destination + check_in
        String leavetime = suggestTime(instantStr, duration+30) ;

        System.out.println("Your Location: " + origin
                + "\nDestination: " + destination
                + "\nDistance(km): " + distance
                + "\nDuration (minutes): "+ duration
                + "\nDeparture time: "+ instantStr
                + "\nSuggestion time to leave from your place: "+leavetime);

        //return array distance, duration, suggestion time
        String[] arr = {String.valueOf(distance), String.valueOf(duration), leavetime};
        return arr;
    }

}


