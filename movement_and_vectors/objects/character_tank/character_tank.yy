{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "character_tank",
  "spriteId": {
    "name": "spr_tank_body",
    "path": "sprites/spr_tank_body/spr_tank_body.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "__character",
    "path": "objects/__character/__character.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":8,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"sprite_tank_barrel","varType":5,"value":"spr_tank_barrel","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"move_speed_max","path":"objects/__character/__character.yy",},"objectId":{"name":"__character","path":"objects/__character/__character.yy",},"value":"8",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"move_accel","path":"objects/__character/__character.yy",},"objectId":{"name":"__character","path":"objects/__character/__character.yy",},"value":"0.5",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"move_decel","path":"objects/__character/__character.yy",},"objectId":{"name":"__character","path":"objects/__character/__character.yy",},"value":"1",},
  ],
  "parent": {
    "name": "Tank",
    "path": "folders/Characters/Tank.yy",
  },
}