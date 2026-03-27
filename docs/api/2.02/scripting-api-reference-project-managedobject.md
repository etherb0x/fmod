---
title: "FMOD - Scripting API Reference | Project.ManagedObject"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.ManagedObject

Project level data in Studio is represented as a graph of managed objects. A managed object is comprised of:

-   [ManagedObject.id](scripting-api-reference-project-managedobject.html#managedobjectid): The unique identifier (GUID).
-   [ManagedObject.entity](scripting-api-reference-project-managedobject.html#managedobjectentity): A description of the object type (e.g. `Event`, `MixerGroup`, `Snapshot`).
-   [ManagedObject.properties](scripting-api-reference-project-managedobject.html#managedobjectproperties): Each property is a simple data field (e.g. float, bool, string) with a value.
-   [ManagedObject.relationships](scripting-api-reference-project-managedobject.html#managedobjectrelationships): Links to other `ManagedObject`s, known as `destinations`. These can be `ToOne` or `ToMany`, and may or may not be ordered.

Beyond the generic interface presented for each `ManagedObject`, a number of extension functions are available for `ManagedObject`s of a particular [project.Entity](scripting-api-reference-project-entity.html) type.

The root managed object of a project can be retrieved using [studio.project.workspace](https://fmod.com/docs/2.02/studio/scripting-api-reference-project-workspace.html). Objects within a project of a particular [project.Entity](scripting-api-reference-project-entity.html) can be retrieved using [Entity.findInstances](scripting-api-reference-project-entity.html#entityfindinstances).

### [ManagedObject](#managedobject)

**Properties:**

-   [ManagedObject.entity](scripting-api-reference-project-managedobject.html#managedobjectentity "A string representing the object's project.Entity type.") A string representing the object's `project.Entity` type.
-   [ManagedObject.id](scripting-api-reference-project-managedobject.html#managedobjectid "The object's unique ID.") The object's unique ID.
-   [ManagedObject.isValid](scripting-api-reference-project-managedobject.html#managedobjectisvalid "Returns whether an object is in a valid state.") Returns whether an object is in a valid state.
-   [ManagedObject.properties](scripting-api-reference-project-managedobject.html#managedobjectproperties "Provides access to an object's properties.") Provides access to an object's properties.
-   [ManagedObject.%property\_name%](scripting-api-reference-project-managedobject.html#managedobjectproperty_name "Provides access to a ManagedObject property's value.") Provides access to a `ManagedObject` property's value.
-   [ManagedObject.%relationship\_name%](scripting-api-reference-project-managedobject.html#managedobjectrelationship_name "Provides access to a ManagedObject relationship's destinations.") Provides access to a `ManagedObject` relationship's destinations.
-   [ManagedObject.relationships](scripting-api-reference-project-managedobject.html#managedobjectrelationships "Provides access to an object's relationships.") Provides access to an object's relationships.

**Methods:**

-   [ManagedObject.document](scripting-api-reference-project-managedobject.html#managedobjectdocument "Returns a string describing this ManagedObject's entity type.") Returns a string describing this `ManagedObject`'s entity type.
-   [ManagedObject.dump](scripting-api-reference-project-managedobject.html#managedobjectdump "Logs all members.") Logs all members.
-   [ManagedObject.isOfExactType](scripting-api-reference-project-managedobject.html#managedobjectisofexacttype "Returns true if the object type matches the provided entity name.") Returns true if the object type matches the provided entity name.
-   [ManagedObject.isOfType](scripting-api-reference-project-managedobject.html#managedobjectisoftype "Returns true if the object has an entity that matches the entity name, or is of a derived type.") Returns true if the object has an entity that matches the entity name, or is of a derived type.

### [ManagedPropertyMap](#managedpropertymap)

**Properties:**

-   [ManagedPropertyMap.parent](scripting-api-reference-project-managedobject.html#managedpropertymapparent "The owning ManagedObject of the property map.") The owning `ManagedObject` of the property map.
-   [ManagedPropertyMap.%property\_name%](scripting-api-reference-project-managedobject.html#managedpropertymapproperty_name "Returns a ManagedProperty for the given property name.") Returns a `ManagedProperty` for the given property name.

**Methods:**

-   [ManagedPropertyMap.dump](scripting-api-reference-project-managedobject.html#managedpropertymapdump "Logs all members.") Logs all members.

### [ManagedProperty](#managedproperty)

**Properties:**

-   [ManagedProperty.dataType](scripting-api-reference-project-managedobject.html#managedpropertydatatype "The type of data stored by this managed property's value.") The type of data stored by this managed property's value.
-   [ManagedProperty.defaultValue](scripting-api-reference-project-managedobject.html#managedpropertydefaultvalue "The default value that the ManagedProperty was initialized with.") The default value that the `ManagedProperty` was initialized with.
-   [ManagedProperty.name](scripting-api-reference-project-managedobject.html#managedpropertyname "The name of the property.") The name of the property.
-   [ManagedProperty.parent](scripting-api-reference-project-managedobject.html#managedpropertyparent "The owning ManagedObject of the property.") The owning `ManagedObject` of the property.

**Methods:**

-   [ManagedProperty.dump](scripting-api-reference-project-managedobject.html#managedpropertydump "Logs all members.") Logs all members.
-   [ManagedProperty.setValue](scripting-api-reference-project-managedobject.html#managedpropertysetvalue "Sets the value stored by the property.") Sets the value stored by the property.
-   [ManagedProperty.value](scripting-api-reference-project-managedobject.html#managedpropertyvalue "The value stored by the property.") The value stored by the property.

### [ManagedRelationshipMap](#managedrelationshipmap)

**Properties:**

-   [ManagedRelationshipMap.parent](scripting-api-reference-project-managedobject.html#managedrelationshipmapparent "The owning ManagedObject of the relationship map.") The owning `ManagedObject` of the relationship map.
-   [ManagedRelationshipMap.%relationship\_name%](scripting-api-reference-project-managedobject.html#managedrelationshipmaprelationship_name "Returns a ManagedRelationship for the given relationship name.") Returns a `ManagedRelationship` for the given relationship name.

**Methods:**

-   [ManagedRelationshipMap.dump](scripting-api-reference-project-managedobject.html#managedrelationshipmapdump "Logs all members.") Logs all members.

### [ManagedRelationship](#managedrelationship)

**Properties:**

-   [ManagedRelationship.cardinality](scripting-api-reference-project-managedobject.html#managedrelationshipcardinality "A string representing the object's cardinality.") A string representing the object's cardinality.
-   [ManagedRelationship.destinations](scripting-api-reference-project-managedobject.html#managedrelationshipdestinations "An array of ManagedObject destinations.") An array of `ManagedObject` destinations.
-   [ManagedRelationship.name](scripting-api-reference-project-managedobject.html#managedrelationshipname "The name of the relationship.") The name of the relationship.
-   [ManagedRelationship.isOrdered](scripting-api-reference-project-managedobject.html#managedrelationshipisordered "A constant boolean value that is set to true if the relationship is ordered.") A constant boolean value that is set to true if the relationship is ordered.
-   [ManagedRelationship.parent](scripting-api-reference-project-managedobject.html#managedrelationshipparent "The owning ManagedObject of the relationship.") The owning `ManagedObject` of the relationship.

**Methods:**

-   [ManagedRelationship.add](scripting-api-reference-project-managedobject.html#managedrelationshipadd "Appends a new destination to a relationship.") Appends a new destination to a relationship.
-   [ManagedRelationship.dump](scripting-api-reference-project-managedobject.html#managedrelationshipdump "Logs all members.") Logs all members.
-   [ManagedRelationship.insert](scripting-api-reference-project-managedobject.html#managedrelationshipinsert "Inserts a new destination to a relationship at a given index.") Inserts a new destination to a relationship at a given index.
-   [ManagedRelationship.remove](scripting-api-reference-project-managedobject.html#managedrelationshipremove "Removes a destination from a relationship.") Removes a destination from a relationship.

## [ManagedObject.entity](#managedobjectentity)

A string representing the object's [project.Entity](scripting-api-reference-project-entity.html) type.

Lookup [project.model](scripting-api-reference-project-model.html) to inspect details about the entity. Immutable.

## [ManagedObject.id](#managedobjectid)

The object's unique ID.

Immutable.

## [ManagedObject.isValid](#managedobjectisvalid)

Returns whether an object is in a valid state.

An object may become invalid if it is deleted or if it has a `null` value for one or more of its required [entity.relationships](scripting-api-reference-project-entity.html#entityrelationships).

Immutable.

## [ManagedObject.properties](#managedobjectproperties)

Provides access to an object's properties.

Returns a [ManagedPropertyMap](scripting-api-reference-project-managedobject.html#managedpropertymap).

Immutable.

## [ManagedObject.%property\_name%](#managedobjectproperty_name)

Provides access to a [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) property's value.

Setting the property (with the `=` operator) will set the property value.

## [ManagedObject.%relationship\_name%](#managedobjectrelationship_name)

Provides access to a [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) relationship's destinations.

Getting a `ToOne` relationship will return the single destination object (or `null` if it is unassigned). Getting a `ToMany` relationship returns an array of destinations (or an empty array if it has no destinations). Setting a `ToOne` relationship (with the `=` operator) will set or replace the current destinations. `ToMany` relationships cannot be modified with the `=` operator.

## [ManagedObject.relationships](#managedobjectrelationships)

Provides access to an object's relationships.

Returns a [ManagedRelationshipMap](scripting-api-reference-project-managedobject.html#managedrelationshipmap).

Immutable.

## [ManagedObject.document](#managedobjectdocument)

Returns a string describing this [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject)'s entity type.

```javascript
ManagedObject.document()
```

As an example, calling `studio.project.workspace.mixer.masterBus.volume = 2`, would walk through the `Workspace`'s relationship to the global `Mixer`, then the `Mixer`'s relationship to the `MasterBus`, and finally sets the volume property on the `MasterBus` to 2 dB.

**See Also:** [project.Entity](scripting-api-reference-project-entity.html)

## [ManagedObject.dump](#managedobjectdump)

Logs all members.

```javascript
ManagedObject.dump()
```

Use this function to see what functions and properties are available on any [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject). This is particularly useful for finding undocumented functionality.

## [ManagedObject.isOfExactType](#managedobjectisofexacttype)

Returns true if the object type matches the provided entity name.

```javascript
ManagedObject.isOfExactType(
    entityName
)
```

entityName

The name of the [project.Entity](scripting-api-reference-project-entity.html) type to compare against.

This does not include derived types.

## [ManagedObject.isOfType](#managedobjectisoftype)

Returns true if the object has an entity that matches the entity name, or is of a derived type.

```javascript
ManagedObject.isOfType(
    entityName
)
```

entityName

The name of the [project.Entity](scripting-api-reference-project-entity.html) type to compare against.

## [ManagedPropertyMap.parent](#managedpropertymapparent)

The owning [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) of the property map.

Immutable.

## [ManagedPropertyMap.%property\_name%](#managedpropertymapproperty_name)

Returns a [ManagedProperty](scripting-api-reference-project-managedobject.html#managedproperty) for the given property name.

Immutable.

## [ManagedPropertyMap.dump](#managedpropertymapdump)

Logs all members.

```javascript
ManagedPropertyMap.dump()
```

Use this function to see what functions and properties are available on any managed property map. This is particularly useful for finding undocumented functionality.

## [ManagedProperty.dataType](#managedpropertydatatype)

The type of data stored by this managed property's value.

Immutable.

## [ManagedProperty.defaultValue](#managedpropertydefaultvalue)

The default value that the [ManagedProperty](scripting-api-reference-project-managedobject.html#managedproperty) was initialized with.

Immutable.

## [ManagedProperty.name](#managedpropertyname)

The name of the property.

Immutable.

## [ManagedProperty.parent](#managedpropertyparent)

The owning [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) of the property.

Immutable.

## [ManagedProperty.dump](#managedpropertydump)

Logs all members.

```javascript
ManagedProperty.dump()
```

Use this function to see what functions and properties are available on any property. This is particularly useful for finding undocumented functionality.

## [ManagedProperty.setValue](#managedpropertysetvalue)

Sets the value stored by the property.

```javascript
ManagedProperty.setValue(
    value
)
```

value

Value to set managed property to.

Returns `true` if the operation succeeds, or `false` otherwise.

## [ManagedProperty.value](#managedpropertyvalue)

The value stored by the property.

Immutable.

## [ManagedRelationshipMap.parent](#managedrelationshipmapparent)

The owning [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) of the relationship map.

Immutable.

## [ManagedRelationshipMap.%relationship\_name%](#managedrelationshipmaprelationship_name)

Returns a [ManagedRelationship](scripting-api-reference-project-managedobject.html#managedrelationship) for the given relationship name.

Immutable.

## [ManagedRelationshipMap.dump](#managedrelationshipmapdump)

Logs all members.

```javascript
ManagedRelationshipMap.dump()
```

Use this function to see what functions and properties are available on any managed relationship map. This is particularly useful for finding undocumented functionality.

## [ManagedRelationship.cardinality](#managedrelationshipcardinality)

A string representing the object's cardinality.

Either `ToOne` or `ToMany`.

Immutable.

## [ManagedRelationship.destinations](#managedrelationshipdestinations)

An array of [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) destinations.

Immutable.

## [ManagedRelationship.name](#managedrelationshipname)

The name of the relationship.

Immutable.

## [ManagedRelationship.isOrdered](#managedrelationshipisordered)

A constant boolean value that is set to true if the relationship is ordered.

## [ManagedRelationship.parent](#managedrelationshipparent)

The owning [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) of the relationship.

Immutable.

## [ManagedRelationship.add](#managedrelationshipadd)

Appends a new destination to a relationship.

```javascript
ManagedRelationship.add(
    managedObject
)
```

managedObject

[ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) to add to relationship.

Replaces the current destination for a `ToOne` relationship. Returns `true` if the operation succeeds, or `false` otherwise.

## [ManagedRelationship.dump](#managedrelationshipdump)

Logs all members.

```javascript
ManagedRelationship.dump()
```

Use this function to see what functions and properties are available on any managed relationship. This is particularly useful for finding undocumented functionality.

## [ManagedRelationship.insert](#managedrelationshipinsert)

Inserts a new destination to a relationship at a given index.

```javascript
ManagedRelationship.insert(
    index,
    managedObject
)
```

index

Index to insert at. Must be in range [0, destinations.length].

managedObject

The [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) to add to the relationship.

Returns `true` if the operation succeeds, or `false` otherwise.

## [ManagedRelationship.remove](#managedrelationshipremove)

Removes a destination from a relationship.

```javascript
ManagedRelationship.remove(
    managedObject
)
```

managedObject

[ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) to remove from relationship.

Returns `true` if the operation succeeds, or `false` otherwise.

## [ManagedRelationship.isOrdered](#managedrelationshipisordered_1)

A constant boolean value that is set to true if the relationship is ordered.
