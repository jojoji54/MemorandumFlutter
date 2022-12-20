
import 'dart:convert';

List<Data> dataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
    Data({
        this.id,
        this.name,
        this.tagline,
        this.firstBrewed,
        this.description,
        this.imageUrl,
        this.abv,
        this.ibu,
        this.targetFg,
        this.targetOg,
        this.ebc,
        this.srm,
        this.ph,
        this.attenuationLevel,
        this.volume,
        this.boilVolume,
        this.method,
        this.ingredients,
        this.foodPairing,
        this.brewersTips,
        this.contributedBy,
    });

    int id;
    String name;
    String tagline;
    String firstBrewed;
    String description;
    String imageUrl;
    double abv;
    double ibu;
    int targetFg;
    int targetOg;
    double ebc;
    double srm;
    double ph;
    double attenuationLevel;
    BoilVolume volume;
    BoilVolume boilVolume;
    Method method;
    Ingredients ingredients;
    List<String> foodPairing;
    String brewersTips;
    ContributedBy contributedBy;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        firstBrewed: json["first_brewed"],
        description: json["description"],
        imageUrl: json["image_url"],
        abv: json["abv"].toDouble(),
        ibu: json["ibu"] == null ? null : json["ibu"].toDouble(),
        targetFg: json["target_fg"],
        targetOg: json["target_og"],
        ebc: json["ebc"] == null ? null : json["ebc"].toDouble(),
        srm: json["srm"] == null ? null : json["srm"].toDouble(),
        ph: json["ph"] == null ? null : json["ph"].toDouble(),
        attenuationLevel: json["attenuation_level"].toDouble(),
        volume: BoilVolume.fromJson(json["volume"]),
        boilVolume: BoilVolume.fromJson(json["boil_volume"]),
        method: Method.fromJson(json["method"]),
        ingredients: Ingredients.fromJson(json["ingredients"]),
        foodPairing: List<String>.from(json["food_pairing"].map((x) => x)),
        brewersTips: json["brewers_tips"],
        contributedBy: contributedByValues.map[json["contributed_by"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "first_brewed": firstBrewed,
        "description": description,
        "image_url": imageUrl,
        "abv": abv,
        "ibu": ibu == null ? null : ibu,
        "target_fg": targetFg,
        "target_og": targetOg,
        "ebc": ebc == null ? null : ebc,
        "srm": srm == null ? null : srm,
        "ph": ph == null ? null : ph,
        "attenuation_level": attenuationLevel,
        "volume": volume.toJson(),
        "boil_volume": boilVolume.toJson(),
        "method": method.toJson(),
        "ingredients": ingredients.toJson(),
        "food_pairing": List<dynamic>.from(foodPairing.map((x) => x)),
        "brewers_tips": brewersTips,
        "contributed_by": contributedByValues.reverse[contributedBy],
    };
}

class BoilVolume {
    BoilVolume({
        this.value,
        this.unit,
    });

    double value;
    Unit unit;

    factory BoilVolume.fromJson(Map<String, dynamic> json) => BoilVolume(
        value: json["value"].toDouble(),
        unit: unitValues.map[json["unit"]],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unitValues.reverse[unit],
    };
}

enum Unit { LITRES, GRAMS, KILOGRAMS, CELSIUS }

final unitValues = EnumValues({
    "celsius": Unit.CELSIUS,
    "grams": Unit.GRAMS,
    "kilograms": Unit.KILOGRAMS,
    "litres": Unit.LITRES
});

enum ContributedBy { SAM_MASON_SAMJBMASON }

final contributedByValues = EnumValues({
    "Sam Mason <samjbmason>": ContributedBy.SAM_MASON_SAMJBMASON
});

class Ingredients {
    Ingredients({
        this.malt,
        this.hops,
        this.yeast,
    });

    List<Malt> malt;
    List<Hop> hops;
    String yeast;

    factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        malt: List<Malt>.from(json["malt"].map((x) => Malt.fromJson(x))),
        hops: List<Hop>.from(json["hops"].map((x) => Hop.fromJson(x))),
        yeast: json["yeast"],
    );

    Map<String, dynamic> toJson() => {
        "malt": List<dynamic>.from(malt.map((x) => x.toJson())),
        "hops": List<dynamic>.from(hops.map((x) => x.toJson())),
        "yeast": yeast,
    };
}

class Hop {
    Hop({
        this.name,
        this.amount,
        this.add,
        this.attribute,
    });

    String name;
    BoilVolume amount;
    Add add;
    Attribute attribute;

    factory Hop.fromJson(Map<String, dynamic> json) => Hop(
        name: json["name"],
        amount: BoilVolume.fromJson(json["amount"]),
        add: addValues.map[json["add"]],
        attribute: attributeValues.map[json["attribute"]],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount.toJson(),
        "add": addValues.reverse[add],
        "attribute": attributeValues.reverse[attribute],
    };
}

enum Add { START, MIDDLE, END, DRY_HOP }

final addValues = EnumValues({
    "dry hop": Add.DRY_HOP,
    "end": Add.END,
    "middle": Add.MIDDLE,
    "start": Add.START
});

enum Attribute { BITTER, FLAVOUR, AROMA }

final attributeValues = EnumValues({
    "aroma": Attribute.AROMA,
    "bitter": Attribute.BITTER,
    "flavour": Attribute.FLAVOUR
});

class Malt {
    Malt({
        this.name,
        this.amount,
    });

    String name;
    BoilVolume amount;

    factory Malt.fromJson(Map<String, dynamic> json) => Malt(
        name: json["name"],
        amount: BoilVolume.fromJson(json["amount"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount.toJson(),
    };
}

class Method {
    Method({
        this.mashTemp,
        this.fermentation,
        this.twist,
    });

    List<MashTemp> mashTemp;
    Fermentation fermentation;
    String twist;

    factory Method.fromJson(Map<String, dynamic> json) => Method(
        mashTemp: List<MashTemp>.from(json["mash_temp"].map((x) => MashTemp.fromJson(x))),
        fermentation: Fermentation.fromJson(json["fermentation"]),
        twist: json["twist"] == null ? null : json["twist"],
    );

    Map<String, dynamic> toJson() => {
        "mash_temp": List<dynamic>.from(mashTemp.map((x) => x.toJson())),
        "fermentation": fermentation.toJson(),
        "twist": twist == null ? null : twist,
    };
}

class Fermentation {
    Fermentation({
        this.temp,
    });

    BoilVolume temp;

    factory Fermentation.fromJson(Map<String, dynamic> json) => Fermentation(
        temp: BoilVolume.fromJson(json["temp"]),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp.toJson(),
    };
}

class MashTemp {
    MashTemp({
        this.temp,
        this.duration,
    });

    BoilVolume temp;
    int duration;

    factory MashTemp.fromJson(Map<String, dynamic> json) => MashTemp(
        temp: BoilVolume.fromJson(json["temp"]),
        duration: json["duration"] == null ? null : json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp.toJson(),
        "duration": duration == null ? null : duration,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
