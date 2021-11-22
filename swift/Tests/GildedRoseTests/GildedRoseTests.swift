@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    // Test quality value for normal item
    func testQualityValueForNormalProduct() {
        let input = [Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)]
        let expectedResult = 19
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
    // Test quality value special item
    func testQualityValueForSpecialProduct() {
        let input = [Item(name: "Aged Brie", sellIn: 2, quality: 49)]
        let expectedResult = 50
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
    // Test quality value shouldnt change for `Sulfuras, Hand of Ragnaros`
    func testQualityValueShouldntChangeOnSulfuras() {
        let input = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 2, quality: 20)]
        let expectedResult = 20
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
    // Test quality value for special item in on sellIn < 6 && sellIn < 11
    func testQualityValueForSpecialOnSellInLessThanSixAndEleven() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 4, quality: 20)]
        let expectedResult = 23
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
    // Test quality value for special item in on sellIn < 11
    func testQualityValueForSpecialOnSellInLessEleven() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 8, quality: 20)]
        let expectedResult = 22
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
    // Test quality value for `Aged Brie`
    func testQualityValueForAgedBrieOnSell() {
        let input = [Item(name: "Aged Brie", sellIn: 8, quality: 33)]
        let expectedResult = 34
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
    // Test sell in value should change for normal item
    func testSellInValueForNormalItem() {
        let input = [Item(name: "Elixir of the Mongoose", sellIn: 6, quality: 14)]
        let expectedResult = 5
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].sellIn, expectedResult)
    }
    
    // Test sell in value shouldnt change for `Sulfuras, Hand of Ragnaros`
    func testSellInValueShouldChangeForSulfuras() {
        let input = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 6, quality: 43)]
        let expectedResult = 6
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].sellIn, expectedResult)
    }
    
    // Test sell in is more than 0 and item is normal
    func testSellInValueMoreThanZeroForNormalItem() {
        let input = [Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 43)]
        let expectedResult = 42
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
    // Test sell in is less than 0 and item is `Aged Brie` With quality of more than 50
    func testQualityValueMoreThanFiftyForAgedBrie() {
        let input = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 54)]
        let expectedResult = 54
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
    // Test sell in is more than 0 and item is `Backstage passes to a TAFKAL80ETC concert`
    func testSellInValueIsMoreThanZeroForTAFKAL80ETC() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -5, quality: 20)]
        let expectedResult = 0
        
        let app = GildedRose(items: input)
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].quality, expectedResult)
    }
    
}
