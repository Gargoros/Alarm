//
//  SoundConstants.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import Foundation

enum Sounds: String, CaseIterable, Codable {
    //MARK: Ringtone Sounds
    case wakeUp = "Sound Wake up.aiff"
    case lagrima = "Lagrima.aiff"
    case christmasBells = "christmas_bells.mp3"
    case mrGrinchRavens = "mr_grinch_ravens.mp3"
    case myBaby = "my_baby.mp3"
    case peanutsRingtone = "peanuts_ringtone.mp3"
    case tennesseeWhiskey = "tennessee_whiskey.mp3"
    case turkeyTime = "turkey_time.mp3"
    case wastedOnU = "wasted_on_u.mp3"
    case welcomeToMyHouse = "welcome_to_my_house.mp3"
    
    //MARK: Nature Sounds
    case birdForest = "bird forest.mp3"
    case birdVoices = "bird voices.mp3"
    case forestBirdsSweden = "forest birds sweden.mp3"
    case forestWithCuckooBirds = "forest with cuckoo birds.mp3"
    case nightAmbience = "night ambience.mp3"
    case owlHooting = "owl hooting.mp3"
    case screechingOwl = "screeching owl.mp3"
    case softRainAmbient = "soft rain ambient.mp3"
    case theBeatOfNature = "the beat of nature.mp3"
    case waterfall = "waterfall.mp3"
    
}

let ringToneSoundsList: [Sounds] = [
    .wakeUp, .lagrima, .christmasBells,
    .mrGrinchRavens, .myBaby, .peanutsRingtone,
    .tennesseeWhiskey, .turkeyTime, .wastedOnU,
    .welcomeToMyHouse]

let natureSoundsList: [Sounds] = [
    .birdForest, .birdVoices, .forestBirdsSweden,
    .forestWithCuckooBirds, .nightAmbience, .owlHooting,
    .screechingOwl, .softRainAmbient, .theBeatOfNature,
    .waterfall]
