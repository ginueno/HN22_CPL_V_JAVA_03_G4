package entities;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class Car {
    public String licensePlate;
    public String carColor;
    public String carType;
    public int company;
    public int parkId;
}
