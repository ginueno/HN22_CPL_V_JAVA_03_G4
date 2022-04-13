package entities;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class ParkingLot {
    private int parkId;
    private int parkArea;
    private String parkName;
    private String parkPlace;
    private int parkPrice;
    private String parkStatus;
}
