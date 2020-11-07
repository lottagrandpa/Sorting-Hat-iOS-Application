//
//  XMLPeopleParser.swift
//  CustomTableTest
//
//  Created by 张佳盈 on 2020/2/25.
//  Copyright © 2020 lottagrandpa. All rights reserved.
//

import Foundation

class XMLPeopleParser: NSObject, XMLParserDelegate{
    
    var name:String
    init(name:String){
        self.name = name
    }
    
    // variables needed to parse
    var pName, pHouse, pImage, pActor, pPatronus, pWand, pDateOfBirth, pGender, pSpecies, pBlood, pRoleLink, pActorLink : String!
    var elementId: Int!
    var passData: Bool!
    var tags = ["name", "house", "image", "actor", "patronus", "wand", "dateOfBirth", "gender", "species", "blood", "roleLink", "actorLink"]
    
    var gryffindor = [Person]()
    var slytherin = [Person]()
    var hufflepuff = [Person]()
    var ravenclaw = [Person]()
    
    var parser = XMLParser()
    
    // funcs to override
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        // test elementId to save string into pVariables
        switch elementId{
            case 0: pName = string
            case 1: pHouse = string
            case 2: pImage = string
            case 3: pActor = string
            case 4: pPatronus = string
            case 5: pWand = string
            case 6: pDateOfBirth = string
            case 7: pGender = string
            case 8: pSpecies = string
            case 9: pBlood = string
            case 10: pRoleLink = string
            case 11: pActorLink = string
            default : break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        // reset the spy vars if in tags
        if tags.contains(elementName){
            elementId = -1
            passData = false
        }
        // if elementName is person
        if elementName == "person"{
            let p = Person(name: pName, house: pHouse, image: pImage, actor: pActor, patronus: pPatronus, wand: pWand, dateOfBirth: pDateOfBirth, gender: pGender, species: pSpecies, blood: pBlood, roleLink: pRoleLink, actorLink: pActorLink)
            if(pHouse == "Gryffindor"){
                gryffindor.append(p)
            }else if(pHouse == "Slytherin"){
                slytherin.append(p)
            }else if (pHouse == "Hufflepuff"){
                hufflepuff.append(p)
            }else if (pHouse == "Ravenclaw"){
                ravenclaw.append(p)
            }
            
        }
        
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        // if elementName is one of the tags, get its elementId
        if tags.contains(elementName){
            // set the parsing data
            switch elementName
            {
                case "name": elementId = 0
                case "house": elementId = 1
                case "image": elementId = 2
                case "actor": elementId = 3
                case "patronus": elementId = 4
                case "wand": elementId = 5
                case "dateOfBirth": elementId = 6
                case "gender": elementId = 7
                case "species": elementId = 8
                case "blood":elementId = 9
                case "roleLink":elementId = 10
                case "actorLink":elementId = 11
                default : break
            }
            passData = true
        }
    }
    
    func parsing(){
        // get the url for the file
        let bundleUrl = Bundle.main.bundleURL
        let fileUrl = URL(fileURLWithPath: name, relativeTo: bundleUrl)
        
        // make a parser
        parser = XMLParser(contentsOf: fileUrl)!
        
        // delegate it and parse it
        parser.delegate = self
        parser.parse()
        
    }
}

