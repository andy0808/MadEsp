import SwiftIO
import CMadEsp

func getClassPointer<T: AnyObject>(_ obj: T) -> UnsafeRawPointer {
    return UnsafeRawPointer(Unmanaged.passUnretained(obj).toOpaque())
}

public class MadEsp {
    private let madEspInterface: mad_esp_interface
    private let eventType: mad_esp_event_t = MAD_ESP_WIFI_EVT_AP_STACONNECTED

    public init(
        spi: SPI,
        cs: DigitalOut,
        reset: DigitalOut,
        hand: DigitalIn,
        ready: DigitalIn) {

        let spi = getClassPointer(spi)
        let spi_cs_gpio = getClassPointer(cs)
        let reset_gpio = getClassPointer(reset)
        let hand_gpio = getClassPointer(hand)
        let ready_gpio = getClassPointer(ready)

        madEspInterface = mad_esp_interface(
            spi: spi,
            spi_cs_gpio: spi_cs_gpio,
            reset_gpio: reset_gpio,
            hand_gpio: hand_gpio,
            ready_gpio: ready_gpio)

        let interfacePtr = getClassPointer(self)
    }

    
}
