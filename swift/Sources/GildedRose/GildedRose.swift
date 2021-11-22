
public class GildedRose {
    var items: [Item]

    // MARK: - Initializer
    public init(items: [Item]) {
        self.items = items
    }

    // MARK: - Main Function For Updating
    public func updateQuality() {
        items.forEach { item in
            if item.name != .agedBrie && item.name != .tafkal80ETC {
                guard item.quality > 0 && item.name != .sulfuras else {
                    return
                }

                item.quality -= 1
            } else {
                guard item.quality < 50 else {
                    return
                }

                item.quality += 1

                if item.name == .tafkal80ETC {
                    if item.sellIn < 11 && item.quality < 50 {
                        item.quality = item.sellIn < 6 ? item.quality + 2 : item.quality + 1
                    }
                }
            }

            item.sellIn = item.name == .sulfuras ? item.sellIn : item.sellIn - 1

            guard item.sellIn < 0 else {
                return
            }

            if item.name != .agedBrie {
                if item.name != .tafkal80ETC {
                    guard item.quality > 0 && item.name != .sulfuras else {
                        return
                    }

                    item.quality -= 1
                } else {
                    item.quality = item.quality - item.quality
                }
            } else {
                guard item.quality < 50 else {
                    return
                }

                item.quality += 1
            }
        }
    }

}
