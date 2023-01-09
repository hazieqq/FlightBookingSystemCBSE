package com.aerotravel.flightticketbooking;


import com.google.maps.DistanceMatrixApi;
import com.google.maps.DistanceMatrixApiRequest;
import com.google.maps.GeoApiContext;
import com.google.maps.errors.ApiException;
import com.google.maps.model.DistanceMatrix;
import com.google.maps.model.TrafficModel;
import com.google.maps.model.TravelMode;
import java.io.IOException;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DepartureTime {

    public static DistanceMatrix setupAPI(String origin,String destination) throws ApiException, InterruptedException, IOException{
        GeoApiContext context = new GeoApiContext.Builder().apiKey("AIzaSyDmRKaIKB7miLz_BDES9Nt8zGAnbpXifCo").build();
        DistanceMatrixApiRequest request = DistanceMatrixApi.newRequest(context);
        request.origins(origin);
        request.destinations(destination);
        request.mode(TravelMode.DRIVING);

        Instant cur = Instant.now();
        cur = cur.plus(Duration.ofDays(1));
        request.departureTime(cur);
        request.trafficModel(TrafficModel.PESSIMISTIC);
        DistanceMatrix response = request.await();
        return response;
    }

    public static double distanceInKM(String origin,String destination) throws ApiException, InterruptedException, IOException{
        DistanceMatrix response = setupAPI(origin,destination);
        double distanceInMeters = response.rows[0].elements[0].distance.inMeters;
        double distanceInKilometers = distanceInMeters / 1000.0;
        return distanceInKilometers;
    }

    public static long durationInMinutes(String origin,String destination) throws ApiException, InterruptedException, IOException{
        DistanceMatrix response = setupAPI(origin,destination);
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

    public static void main(String[] args) throws ApiException, InterruptedException, IOException {


        String origin = "Kuala Lumpur International Airport, 64000 Sepang, Selangor";
        String destination = "Taman Danau Desa, 58100 Kuala Lumpur, Federal Territory of Kuala Lumpur";
        String departuretime = "2023-01-07 17:00:00";
        double distance = distanceInKM(origin,destination);
        long duration = durationInMinutes(origin,destination) + 30; // destination + check_in
        String leavetime = suggestTime(departuretime, duration);

        System.out.println("Your Location: " + origin
                + "\nDestination: " + destination
                + "Distance(km): " + distance
                + "\nDuration (minutes): "+ duration
                + "\nDeparture time: "+ departuretime
                + "\nSuggestion time to leave from your place: "+leavetime);





    }

}


