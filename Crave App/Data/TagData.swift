//
//  TagData.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/21/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//


var sharedTagData:TagData = TagData()

class TagData {
    // will create a list of relevant search terms to the user. 
    // set below to new values whenever the user eats.

    
    var relevantUserTags: [String] = []
    var unorderedRelevantUserTags: [String] = []
    
    static func returnRelevantCategories() -> [String]{
        for(key, value) in sharedTagData.allRestaurantCategoryIDs {
            if value > 0 {
                sharedTagData.unorderedRelevantUserTags.append(key as String)
            }
        }
        return sharedTagData.unorderedRelevantUserTags
    }
    
    static func sharedInstance() -> TagData {
        return sharedTagData
    }
    
    init() {
        let ingredients = self.ingredientArray
        let categoryFrequency = self.userCategoryFrequency
    }
    
    
    let ingredientArray = ["Abalone", "Absinthe", "Achar", "Ackee", "Adobo", "Advieh", "Agar", "Aioli", "Ajowan", "Ale","Alitame", "Alligator", "Allspice", "Almond", "Alum", "Amaranth", "Amaretti", "Amaretto", "Amla", "Anchovette","Anchovy", "Angelica", "Anise", "Apple", "Apricot", "Aquavit", "Arak", "Arrowroot", "Artichoke", "Arugula", "Asadero", "Asafetida", "Asparagus", "Aspic", "Avocado", "Baba", "Babaco", "Babka", "Bacon", "Bagel", "Bagoong", "Baguette", "Baharat", "Baklava", "Banger", "Banana", "Bannock", "Barberry", "Bard", "Almond Bark", "Barley", "Baron", "Basil", "Bass", "Bean", "Azuki bean", "Beat", "Bechamel", "Beef", "Beer", "Beet", "Bento", "Berbere", "Berry", "Ammonium bicarbonate", "Biltong", "Bisque", "Black bean", "Blackberry", "Beurre blanc", "Blanch", "Bake blind", "Blueberry", "Boerewors", "Boil", "Borage", "Borscht", "Bottarga", "Bouillon", "Bourbon", "Braai", "Braise", "Brandy", "Breadcrumb", "Breadfruit", "Bresaola", "Broccoli", "Broil", "Broth", "Brunoise", "Bruschetta", "Buckwheat", "Balmain Bug", "Apple butter", "Butter", "Almond butter", "Buttermilk", "Cabbage", "Cacao", "Cachaca"]
    
    var userCategoryFrequency: [String: Int] = ["4d4b7105d754a06374d81259": 0, "503288ae91d4c4b30a586d67": 0, "4bf58dd8d48988d1c8941735": 0, "4bf58dd8d48988d10a941735": 0, "4bf58dd8d48988d14e941735": 0, "4bf58dd8d48988d157941735":0, "4bf58dd8d48988d142941735" : 0, "52e81612bcbc57f1066b7a03":0, "4eb1bd1c3b7b55596b4a748f":0, "52e81612bcbc57f1066b79fb" : 0, "52af0bd33cf9994f4e043bdd" : 0, "4bf58dd8d48988d111941735": 0, "55a59bace4b013909087cb0c" : 0, "55a59bace4b013909087cb30" : 0, "55a59bace4b013909087cb21": 0, "55a59bace4b013909087cb06": 0, "55a59bace4b013909087cb1b": 0, "55a59bace4b013909087cb1e": 0, "55a59bace4b013909087cb18": 0, "55a59bace4b013909087cb24": 0, "55a59bace4b013909087cb15": 0, "55a59bace4b013909087cb27": 0, "55a59bace4b013909087cb12": 0, "4bf58dd8d48988d1d2941735": 0, "55a59bace4b013909087cb2d": 0, "55a59a31e4b013909087cb00": 0, "55a59af1e4b013909087cb03": 0, "55a59bace4b013909087cb2a": 0, "55a59bace4b013909087cb0f": 0, "55a59bace4b013909087cb33": 0, "55a59bace4b013909087cb09": 0, "55a59bace4b013909087cb36": 0, "4bf58dd8d48988d113941735": 0, "4bf58dd8d48988d156941735": 0, "4eb1d5724b900d56c88a45fe": 0, "4bf58dd8d48988d1d1941735": 0, "4bf58dd8d48988d149941735": 0, "52af39fb3cf9994f4e043be9": 0, "4bf58dd8d48988d14a941735": 0, "4bf58dd8d48988d169941735": 0, "52e81612bcbc57f1066b7a01": 0, "4bf58dd8d48988d1df931735": 0, "4bf58dd8d48988d179941735": 0, "4bf58dd8d48988d16a941735": 0, "52e81612bcbc57f1066b7a02": 0, "52e81612bcbc57f1066b79f1": 0]
    
    let allRestaurantCategoryIDs: [String: Int] = ["4d4b7105d754a06374d81259": 0, "503288ae91d4c4b30a586d67": 0, "4bf58dd8d48988d1c8941735": 0, "4bf58dd8d48988d10a941735": 0, "4bf58dd8d48988d14e941735": 0, "4bf58dd8d48988d157941735": 0, "4bf58dd8d48988d142941735": 0, "52e81612bcbc57f1066b7a03": 0, "4eb1bd1c3b7b55596b4a748f": 0, "52e81612bcbc57f1066b79fb": 0, "52af0bd33cf9994f4e043bdd": 0, "4bf58dd8d48988d111941735": 0, "55a59bace4b013909087cb0c": 0, "55a59bace4b013909087cb30": 0, "55a59bace4b013909087cb21": 0, "55a59bace4b013909087cb06": 0, "55a59bace4b013909087cb1b": 0, "55a59bace4b013909087cb1e": 0, "55a59bace4b013909087cb18": 0, "55a59bace4b013909087cb24 ": 0, "55a59bace4b013909087cb15": 0, "55a59bace4b013909087cb27": 0, "55a59bace4b013909087cb12": 0, "4bf58dd8d48988d1d2941735": 0, "55a59bace4b013909087cb2d": 0, "55a59a31e4b013909087cb00": 0, "55a59af1e4b013909087cb03": 0, "55a59bace4b013909087cb2a": 0, "55a59bace4b013909087cb0f": 0, "55a59bace4b013909087cb33": 0, "55a59bace4b013909087cb09": 0, "55a59bace4b013909087cb36": 0, "4bf58dd8d48988d113941735": 0, "4bf58dd8d48988d156941735": 0, "4eb1d5724b900d56c88a45fe": 0, "4bf58dd8d48988d1d1941735": 0, "4bf58dd8d48988d149941735": 0, "52af39fb3cf9994f4e043be9": 0, "4bf58dd8d48988d14a941735": 0, "4bf58dd8d48988d169941735": 0, "52e81612bcbc57f1066b7a01": 0, "4bf58dd8d48988d1df931735": 0, "4bf58dd8d48988d179941735": 0, "4bf58dd8d48988d16a941735": 0, "52e81612bcbc57f1066b7a02": 0, "52e81612bcbc57f1066b79f1": 0, "4bf58dd8d48988d16b941735": 0, "5294c7523cf9994f4e043a62": 0, "52939ae13cf9994f4e043a3b": 0, "52939a9e3cf9994f4e043a36": 0, "52939a643cf9994f4e043a33": 0, "5294c55c3cf9994f4e043a61": 0, "52939af83cf9994f4e043a3d": 0, "52939aed3cf9994f4e043a3c": 0, "52939aae3cf9994f4e043a37": 0, "52939ab93cf9994f4e043a38": 0, "5294cbda3cf9994f4e043a63": 0, "52939ac53cf9994f4e043a39": 0, "52939ad03cf9994f4e043a3a": 0, "52939a7d3cf9994f4e043a34": 0, "4bf58dd8d48988d143941735": 0, "52e81612bcbc57f1066b7a0c": 0, "52e81612bcbc57f1066b79f4": 0, "4bf58dd8d48988d16c941735": 0, "4bf58dd8d48988d128941735": 0, "4bf58dd8d48988d16d941735": 0, "4bf58dd8d48988d17a941735": 0, "4bf58dd8d48988d144941735": 0, "5293a7d53cf9994f4e043a45": 0, "4bf58dd8d48988d145941735": 0, "52af3a5e3cf9994f4e043bea": 0, "52af3a723cf9994f4e043bec": 0, "52af3a7c3cf9994f4e043bed": 0, "52af3a673cf9994f4e043beb": 0, "52af3a903cf9994f4e043bee": 0, "4bf58dd8d48988d1f5931735": 0, "52af3a9f3cf9994f4e043bef": 0, "52af3aaa3cf9994f4e043bf0": 0, "52af3ab53cf9994f4e043bf1": 0, "52af3abe3cf9994f4e043bf2": 0, "52af3ac83cf9994f4e043bf3": 0, "52af3ad23cf9994f4e043bf4": 0, "52af3add3cf9994f4e043bf5": 0, "52af3af23cf9994f4e043bf7": 0, "52af3ae63cf9994f4e043bf6": 0, "52af3afc3cf9994f4e043bf8": 0, "52af3b053cf9994f4e043bf9": 0, "52af3b213cf9994f4e043bfa": 0, "52af3b293cf9994f4e043bfb": 0, "52af3b343cf9994f4e043bfc": 0, "52af3b3b3cf9994f4e043bfd": 0, "52af3b463cf9994f4e043bfe": 0, "52af3b633cf9994f4e043c01": 0, "52af3b513cf9994f4e043bff": 0, "52af3b593cf9994f4e043c00": 0, "52af3b6e3cf9994f4e043c02": 0, "52af3b773cf9994f4e043c03": 0, "52af3b813cf9994f4e043c04": 0,
        "52af3b893cf9994f4e043c05": 0, "52af3b913cf9994f4e043c06": 0, "52af3b9a3cf9994f4e043c07": 0, "52af3ba23cf9994f4e043c08": 0, "4bf58dd8d48988d1e0931735": 0, "52e81612bcbc57f1066b7a00": 0, "52e81612bcbc57f1066b79f2": 0, "52f2ae52bcbc57f1066b8b81": 0, "4bf58dd8d48988d146941735": 0, "4bf58dd8d48988d147941735": 0, "4bf58dd8d48988d108941735": 0, "4bf58dd8d48988d109941735": 0, "52e928d0bcbc57f1066b7e97": 0, "52960bac3cf9994f4e043ac4": 0, "52e928d0bcbc57f1066b7e98": 0, "52e81612bcbc57f1066b7a05": 0, "4bf58dd8d48988d10b941735": 0, "4bf58dd8d48988d16e941735": 0, "4edd64a0c7ddd24ca188df1a": 0,
        "52e81612bcbc57f1066b7a09": 0, "4bf58dd8d48988d120951735": 0, "4bf58dd8d48988d1cb941735": 0, "4bf58dd8d48988d10c941735": 0, "4d4ae6fc7a7b7dea34424761": 0, "4bf58dd8d48988d155941735": 0, "4bf58dd8d48988d10d941735": 0, "4c2cd86ed066bed06c3c5209": 0, "4bf58dd8d48988d10e941735": 0, "53d6c1b0e4b02351e88a83e8": 0, "53d6c1b0e4b02351e88a83e2": 0, "53d6c1b0e4b02351e88a83d8": 0, "53d6c1b0e4b02351e88a83d6": 0, "53d6c1b0e4b02351e88a83e6": 0, "53d6c1b0e4b02351e88a83e4": 0, "53d6c1b0e4b02351e88a83da": 0, "53d6c1b0e4b02351e88a83d4": 0, "53d6c1b0e4b02351e88a83dc": 0, "53d6c1b0e4b02351e88a83e0": 0, "52e81612bcbc57f1066b79f3": 0, "53d6c1b0e4b02351e88a83d2": 0, "53d6c1b0e4b02351e88a83de": 0, "52e81612bcbc57f1066b79ff": 0, "52e81612bcbc57f1066b79fe": 0, "4bf58dd8d48988d16f941735": 0, "52e81612bcbc57f1066b79fa": 0, "4bf58dd8d48988d10f941735": 0, "54135bf5e4b08f3d2429dfe5": 0, "54135bf5e4b08f3d2429dff3": 0, "54135bf5e4b08f3d2429dff5": 0, "54135bf5e4b08f3d2429dfe2": 0, "54135bf5e4b08f3d2429dff2": 0, "54135bf5e4b08f3d2429dfe1": 0, "54135bf5e4b08f3d2429dfe3": 0, "54135bf5e4b08f3d2429dfe8": 0, "54135bf5e4b08f3d2429dfe9": 0, "54135bf5e4b08f3d2429dfe6": 0, "54135bf5e4b08f3d2429dfdf": 0, "54135bf5e4b08f3d2429dfe4": 0, "54135bf5e4b08f3d2429dfe7": 0, "54135bf5e4b08f3d2429dfea": 0, "54135bf5e4b08f3d2429dfeb": 0, "54135bf5e4b08f3d2429dfed": 0, "54135bf5e4b08f3d2429dfee": 0, "54135bf5e4b08f3d2429dff4": 0, "54135bf5e4b08f3d2429dfe0": 0, "54135bf5e4b08f3d2429dfdd": 0, "54135bf5e4b08f3d2429dff6": 0, "54135bf5e4b08f3d2429dfef": 0, "54135bf5e4b08f3d2429dff0": 0, "54135bf5e4b08f3d2429dff1": 0, "54135bf5e4b08f3d2429dfde": 0, "54135bf5e4b08f3d2429dfec": 0, "4deefc054765f83613cdba6f": 0, "52960eda3cf9994f4e043ac9": 0, "52960eda3cf9994f4e043acb": 0, "52960eda3cf9994f4e043aca": 0, "52960eda3cf9994f4e043acc": 0, "52960eda3cf9994f4e043ac7": 0, "52960eda3cf9994f4e043ac8": 0, "52960eda3cf9994f4e043ac5": 0, "52960eda3cf9994f4e043ac6": 0, "4bf58dd8d48988d110941735": 0, "55a5a1ebe4b013909087cbb6": 0, "55a5a1ebe4b013909087cb7c": 0, "55a5a1ebe4b013909087cba7": 0, "55a5a1ebe4b013909087cba1": 0, "55a5a1ebe4b013909087cba4": 0, "55a5a1ebe4b013909087cb95": 0, "55a5a1ebe4b013909087cb89": 0, "55a5a1ebe4b013909087cb9b": 0, "55a5a1ebe4b013909087cb98": 0, "55a5a1ebe4b013909087cbbf": 0, "55a5a1ebe4b013909087cb79": 0, "55a5a1ebe4b013909087cbb0": 0, "55a5a1ebe4b013909087cbb3": 0, "55a5a1ebe4b013909087cb74": 0, "55a5a1ebe4b013909087cbaa": 0, "55a5a1ebe4b013909087cb83": 0, "55a5a1ebe4b013909087cb77": 0, "55a5a1ebe4b013909087cb8c": 0, "55a5a1ebe4b013909087cb92": 0, "55a5a1ebe4b013909087cb8f": 0, "55a5a1ebe4b013909087cb86": 0, "55a5a1ebe4b013909087cbb9": 0, "55a5a1ebe4b013909087cb7f": 0, "55a5a1ebe4b013909087cbbc": 0, "55a5a1ebe4b013909087cb9e": 0, "55a5a1ebe4b013909087cbc2": 0, "55a5a1ebe4b013909087cbad": 0, "52e81612bcbc57f1066b79fd": 0, "52e81612bcbc57f1066b79fc": 0, "4bf58dd8d48988d1be941735": 0, "4bf58dd8d48988d152941735": 0, "4bf58dd8d48988d154941735": 0, "52939a8c3cf9994f4e043a35": 0, "4bf58dd8d48988d1bf941735": 0, "4bf58dd8d48988d1c0941735": 0, "4bf58dd8d48988d1c3941735": 0, "4bf58dd8d48988d1c1941735": 0, "4bf58dd8d48988d153941735": 0, "4bf58dd8d48988d151941735": 0, "4bf58dd8d48988d115941735": 0, "52e81612bcbc57f1066b79f7": 0, "52e81612bcbc57f1066b79f9": 0, "4bf58dd8d48988d1c2941735": 0, "52e81612bcbc57f1066b79f8": 0, "4bf58dd8d48988d1ca941735": 0, "52e81612bcbc57f1066b7a04": 0, "4def73e84765ae376e57713a": 0, "4bf58dd8d48988d1c4941735": 0, "5293a7563cf9994f4e043a44": 0, "52e928d0bcbc57f1066b7e9d": 0, "52e928d0bcbc57f1066b7e9c": 0, "4bf58dd8d48988d1bd941735": 0, "4bf58dd8d48988d1c5941735": 0, "4bf58dd8d48988d1c6941735": 0, "4bf58dd8d48988d1ce941735": 0, "4bf58dd8d48988d1c7941735": 0, "4bf58dd8d48988d1dd931735": 0, "4bf58dd8d48988d1cd941735": 0, "4bf58dd8d48988d107941735": 0, "4eb1bfa43b7b52c0e1adc2e8": 0, "4bf58dd8d48988d14f941735": 0, "4bf58dd8d48988d150941735": 0, "4bf58dd8d48988d14d941735": 0, "4bf58dd8d48988d1db931735": 0, "5413605de4b0ae91d18581a9": 0, "4bf58dd8d48988d1cc941735": 0, "4bf58dd8d48988d158941735": 0, "4bf58dd8d48988d1dc931735": 0, "4f04af1f2fb6e1c99f3db0bb": 0, "530faca9bcbc57f1066bc2f3": 0, "530faca9bcbc57f1066bc2f4": 0, "5283c7b4e4b094cb91ec88d8": 0, "5283c7b4e4b094cb91ec88d9": 0, "5283c7b4e4b094cb91ec88d7": 0, "5283c7b4e4b094cb91ec88db": 0, "5283c7b4e4b094cb91ec88d6": 0, "5283c7b4e4b094cb91ec88d5": 0, "5283c7b4e4b094cb91ec88da": 0, "530faca9bcbc57f1066bc2f2": 0, "5283c7b4e4b094cb91ec88d4": 0, "52e928d0bcbc57f1066b7e96": 0, "52e928d0bcbc57f1066b7e9a": 0, "52e928d0bcbc57f1066b7e9b": 0, "4bf58dd8d48988d1d3941735": 0, "4bf58dd8d48988d14c941735": 0]
    

}

enum FoodCategory: String { // 24 categories
    //http://stackoverflow.com/questions/27347396/enum-of-non-literal-values-in-swift
    case Afghan = "503288ae91d4c4b30a586d67"
    case African = "4bf58dd8d48988d1c8941735,4bf58dd8d48988d10a941735"
    case American = "4bf58dd8d48988d14e941735,4bf58dd8d48988d157941735,4bf58dd8d48988d1df931735,4bf58dd8d48988d16c941735,4d4ae6fc7a7b7dea34424761,4bf58dd8d48988d14c941735"
    case Asian = "4bf58dd8d48988d142941735,52e81612bcbc57f1066b7a03,4eb1bd1c3b7b55596b4a748f,52e81612bcbc57f1066b79fb,52af0bd33cf9994f4e043bdd,4bf58dd8d48988d111941735,55a59bace4b013909087cb0c,55a59bace4b013909087cb30,55a59bace4b013909087cb21,55a59bace4b013909087cb06,55a59bace4b013909087cb1b,55a59bace4b013909087cb1e,55a59bace4b013909087cb18,55a59bace4b013909087cb24,55a59bace4b013909087cb15,55a59bace4b013909087cb27,55a59bace4b013909087cb12,55a59bace4b013909087cb2d,55a59a31e4b013909087cb00,55a59af1e4b013909087cb03,55a59bace4b013909087cb2a,55a59bace4b013909087cb0f,55a59bace4b013909087cb33,55a59bace4b013909087cb09,55a59bace4b013909087cb36,4bf58dd8d48988d113941735,4bf58dd8d48988d156941735,4eb1d5724b900d56c88a45fe,4bf58dd8d48988d1d1941735,52af39fb3cf9994f4e043be9,4bf58dd8d48988d14a941735"
    //        case Australian
    //        case Austrian <- in East Euro
    //        case BBQ <- in American
    //        case Belgian
    //        case Bistro
    //        case Brazilian
    //        case Burgers <- in American
    //        case Cajun
    case Caribbean = "4bf58dd8d48988d144941735"
    //        case Caucasian <-in EastEuro
    case Chinese = "4bf58dd8d48988d145941735,52af3a5e3cf9994f4e043bea,52af3a723cf9994f4e043bec,52af3a7c3cf9994f4e043bed,52af3a673cf9994f4e043beb,52af3a903cf9994f4e043bee,4bf58dd8d48988d1f5931735,52af3a9f3cf9994f4e043bef,52af3aaa3cf9994f4e043bf0,52af3ab53cf9994f4e043bf1,52af3abe3cf9994f4e043bf2,52af3ac83cf9994f4e043bf3,52af3ad23cf9994f4e043bf4,52af3add3cf9994f4e043bf5,52af3af23cf9994f4e043bf7,52af3ae63cf9994f4e043bf6,52af3afc3cf9994f4e043bf8,52af3b053cf9994f4e043bf9,52af3b213cf9994f4e043bfa,52af3b293cf9994f4e043bfb,52af3b343cf9994f4e043bfc,52af3b3b3cf9994f4e043bfd,52af3b463cf9994f4e043bfe,52af3b633cf9994f4e043c01,52af3b513cf9994f4e043bff,52af3b593cf9994f4e043c00,52af3b6e3cf9994f4e043c02,52af3b773cf9994f4e043c03,52af3b813cf9994f4e043c04,52af3b893cf9994f4e043c05,52af3b913cf9994f4e043c06,52af3b9a3cf9994f4e043c07,52af3ba23cf9994f4e043c08"
    //        case Czech <- in EastEuro
    case Deli = "4bf58dd8d48988d146941735"
    case EastEuro = "52e81612bcbc57f1066b7a01,5293a7d53cf9994f4e043a45,52f2ae52bcbc57f1066b8b81,4bf58dd8d48988d109941735,52e928d0bcbc57f1066b7e97,52960bac3cf9994f4e043ac4,52e928d0bcbc57f1066b7e98,52e81612bcbc57f1066b7a04,5293a7563cf9994f4e043a44,52e928d0bcbc57f1066b7e9d,52e928d0bcbc57f1066b7e9c,52e928d0bcbc57f1066b7e96,52e928d0bcbc57f1066b7e9a,52e928d0bcbc57f1066b7e9b"
    //        case English
    case Falafel = "4bf58dd8d48988d10b941735"
    //        case FishChips <-in seafood
    //        case Fondue
    case French = "4bf58dd8d48988d10c941735"
    //        case FriedChicken <-in American
    //        case Gastropub
    case German = "4bf58dd8d48988d10d941735"
    //        case GlutenFree
    case Greek = "4bf58dd8d48988d10e941735,53d6c1b0e4b02351e88a83e8,53d6c1b0e4b02351e88a83e2,53d6c1b0e4b02351e88a83d8,53d6c1b0e4b02351e88a83d6,53d6c1b0e4b02351e88a83e6,53d6c1b0e4b02351e88a83e4,53d6c1b0e4b02351e88a83da,53d6c1b0e4b02351e88a83d4,53d6c1b0e4b02351e88a83dc,53d6c1b0e4b02351e88a83e0,52e81612bcbc57f1066b79f3,53d6c1b0e4b02351e88a83d2,53d6c1b0e4b02351e88a83de"
    //        case Halal
    case Hawaiian = "52e81612bcbc57f1066b79fe"
    //        case Hungarian <- in EastEuro
    case Indian = "4bf58dd8d48988d10f941735,54135bf5e4b08f3d2429dfe5,54135bf5e4b08f3d2429dff3,54135bf5e4b08f3d2429dff5,54135bf5e4b08f3d2429dfe2,54135bf5e4b08f3d2429dff2,54135bf5e4b08f3d2429dfe1,54135bf5e4b08f3d2429dfe3,54135bf5e4b08f3d2429dfe8,54135bf5e4b08f3d2429dfe9,54135bf5e4b08f3d2429dfe6,54135bf5e4b08f3d2429dfdf,54135bf5e4b08f3d2429dfe4,54135bf5e4b08f3d2429dfe7,54135bf5e4b08f3d2429dfea,54135bf5e4b08f3d2429dfeb,54135bf5e4b08f3d2429dfed,54135bf5e4b08f3d2429dfee,54135bf5e4b08f3d2429dff4,54135bf5e4b08f3d2429dfe0,54135bf5e4b08f3d2429dfdd,54135bf5e4b08f3d2429dff6,54135bf5e4b08f3d2429dfef,54135bf5e4b08f3d2429dff0,54135bf5e4b08f3d2429dff1,54135bf5e4b08f3d2429dfde,54135bf5e4b08f3d2429dfec"
    case Indonesian = "4deefc054765f83613cdba6f,52960eda3cf9994f4e043ac9,52960eda3cf9994f4e043acb,52960eda3cf9994f4e043aca,52960eda3cf9994f4e043acc,52960eda3cf9994f4e043ac7,52960eda3cf9994f4e043ac8,52960eda3cf9994f4e043ac5,52960eda3cf9994f4e043ac6"
    case Italian = "4bf58dd8d48988d110941735,55a5a1ebe4b013909087cbb6,55a5a1ebe4b013909087cb7c,55a5a1ebe4b013909087cba7,55a5a1ebe4b013909087cba1,55a5a1ebe4b013909087cba4,55a5a1ebe4b013909087cb95,55a5a1ebe4b013909087cb89,55a5a1ebe4b013909087cb9b,55a5a1ebe4b013909087cb98,55a5a1ebe4b013909087cbbf,55a5a1ebe4b013909087cb79,55a5a1ebe4b013909087cbb0,55a5a1ebe4b013909087cbb3,55a5a1ebe4b013909087cb74,55a5a1ebe4b013909087cbaa,55a5a1ebe4b013909087cb83,55a5a1ebe4b013909087cb77,55a5a1ebe4b013909087cb8c,55a5a1ebe4b013909087cb92,55a5a1ebe4b013909087cb8f,55a5a1ebe4b013909087cb86,55a5a1ebe4b013909087cbb9,55a5a1ebe4b013909087cb7f,55a5a1ebe4b013909087cbbc,55a5a1ebe4b013909087cb9e,55a5a1ebe4b013909087cbc2,55a5a1ebe4b013909087cbad"
    //        case Jewish
    case Mediterranean = "4bf58dd8d48988d1c0941735,4bf58dd8d48988d1c3941735"
    case Mexican = "4bf58dd8d48988d1c1941735,4bf58dd8d48988d153941735,4bf58dd8d48988d151941735"
    case Persian = "52e81612bcbc57f1066b79f7"
    case Pizza = "4bf58dd8d48988d1ca941735"
    //        case Polish <- in EastEuro
    //        case Portugeuese
    //        case Russian <- in EastEuro
    case Seafood = "4bf58dd8d48988d1d2941735,4edd64a0c7ddd24ca188df1a" //contains sushi
    case Steakhouse = "4bf58dd8d48988d1cc941735"
    case Turkish = "4f04af1f2fb6e1c99f3db0bb,530faca9bcbc57f1066bc2f3,530faca9bcbc57f1066bc2f4,5283c7b4e4b094cb91ec88d8,5283c7b4e4b094cb91ec88d9,5283c7b4e4b094cb91ec88d7,5283c7b4e4b094cb91ec88db,5283c7b4e4b094cb91ec88d6,5283c7b4e4b094cb91ec88d5,5283c7b4e4b094cb91ec88da,530faca9bcbc57f1066bc2f2,5283c7b4e4b094cb91ec88d4"
    case Thai = "4bf58dd8d48988d149941735"
    //        case Ukranian <- in EastEuro
    //        case VeggieVegan
    //        case Wings <- in American
    

}




/*

scrape data from the remaining 89 web pages using a script

search all venues within 1 mile radius using tags as search terms. eliminate all that are not restaurants. if it returns satisfactory results, end there. else, expand your radius and eliminate all search results that were not satisfactory and only show the new ones that are satisfactory, combining them with the results from the previous, shorter search.

once you have a certain number of tags (e.g. 25 or something) stop the search and then order your results based on price range, distance, and the other ordering/weighing terms

*/