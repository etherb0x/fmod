---
title: "Scripting API Reference | Project.Entity"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Entity

A `studio.project.Entity` provides information about the type of a [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

The entity for a given [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) can be retrieved using [ManagedObject.entity](scripting-api-reference-project-managedobject.html#managedobjectentity). This provides the string representation for an entity, which can then be looked up in the [project.model](scripting-api-reference-project-model.html).

**Properties:**

-   [entity.isAbstract](scripting-api-reference-project-entity.html#entityisabstract "A constant boolean value that is set to true if an object is the base class of another entity type.") A constant boolean value that is set to true if an object is the base class of another entity type.
-   [entity.isGlobal](scripting-api-reference-project-entity.html#entityisglobal "A constant boolean value that is set to true if an entity exists globally, rather than on a per project basis.") A constant boolean value that is set to true if an entity exists globally, rather than on a per project basis.
-   [entity.isSingleton](scripting-api-reference-project-entity.html#entityissingleton "A constant boolean value that is set to true if only a single ManagedObject instance of the entity can exist at any given time.") A constant boolean value that is set to true if only a single `ManagedObject` instance of the entity can exist at any given time.
-   [entity.properties](scripting-api-reference-project-entity.html#entityproperties "Returns an array of property description objects containing named properties that represent each ManagedObject property available for this entity.") Returns an array of property description objects containing named properties that represent each `ManagedObject` property available for this entity.
-   [entity.superentities](scripting-api-reference-project-entity.html#entitysuperentities "An array of strings representing the entity type inherited by this entity.") An array of strings representing the entity type inherited by this entity.

**Methods:**

-   [entity.document](scripting-api-reference-project-entity.html#entitydocument "Returns a string describing the entity, including its properties and relationships.") Returns a string describing the entity, including its properties and relationships.
-   [entity.findInstances](scripting-api-reference-project-entity.html#entityfindinstances "Returns an array of ManagedObject instances of a given entity type.") Returns an array of `ManagedObject` instances of a given entity type.
-   [entity.singletonInstance](scripting-api-reference-project-entity.html#entitysingletoninstance "Returns the singleton ManagedObject instance of a particular entity type.") Returns the singleton `ManagedObject` instance of a particular entity type.

**Objects:**

-   [Relationship Description Object](scripting-api-reference-project-entity.html#relationship-description-object "An unnamed data object describing the relationship between two entities.") An unnamed data object describing the relationship between two entities.
-   [Property Description Object](scripting-api-reference-project-entity.html#property-description-object "An unnamed data object containing the data type and default value of a property.") An unnamed data object containing the data type and default value of a property.

## [entity.isAbstract](#entityisabstract)

A constant boolean value that is set to true if an object is the base class of another entity type.

Abstract entities cannot be instantiated with [project.create](scripting-api-reference-project.html#projectcreate).

## [entity.isGlobal](#entityisglobal)

A constant boolean value that is set to true if an entity exists globally, rather than on a per project basis.

## [entity.isSingleton](#entityissingleton)

A constant boolean value that is set to true if only a single [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) instance of the entity can exist at any given time.

## [entity.properties](#entityproperties)

Returns an array of property description objects containing named properties that represent each [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) property available for this entity.

**See Also:** [Property Description Object](scripting-api-reference-project-entity.html#property-description-object)

## [entity.superEntities](#entitysuperentities)

An array of strings representing the entity type inherited by this entity.

## [entity.document](#entitydocument)

Returns a string describing the entity, including its properties and relationships.

```javascript
entity.document()
```

## [entity.findInstances](#entityfindinstances)

Returns an array of [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) instances of a given entity type.

```javascript
entity.findInstances(
    [options]
)
```

You can optionally pass an `options` object `{ searchContext, includeDerivedTypes }`. Passing a managed object for the `searchContext` field confines the search to children of that object. Passing `true` for the `includeDerivedTypes` field will allow derived types of the given entity to be returned.

For example:

```javascript
// find all SingleSounds within the project
studio.project.model.SingleSound.findInstances();

// find all SingleSounds within the currently selected event
studio.project.model.SingleSound.findInstances({ searchContext: studio.window.browserCurrent() });

// find all GroupTracks, ReturnTracks and MasterTracks within the currently selected event
studio.project.model.AudioTrack.findInstances({ searchContext: studio.window.browserCurrent(), includeDerivedTypes: true });
```

## [entity.singletonInstance](#entitysingletoninstance)

Returns the singleton [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) instance of a particular entity type.

```javascript
entity.singletonInstance()
```

An error will be thrown if the entity is not a singleton type.

## [Relationship Description Object](#relationship-description-object)

An unnamed data object describing the relationship between two entities.

```javascript
{
    cardinality: [string],
    destinationType: [string],
    isRequired: [bool]
}
```

cardinality

Description of relationship, e.g. one-to-many, many-to-one.

destinationType

Entity type the relationship targets.

isRequired

Indicates whether this relationship is required.

## [Property Description Object](#property-description-object)

An unnamed data object containing the data type and default value of a property.

```javascript
{
    dataType: [string],
    defaultValue: [variant]
}
```

dataType

The type of data the property represents.

defaultValue

The default value of the property.

This is the object type returned from [entity.Properties](scripting-api-reference-project-entity.html#entityproperties).

## [entity.relationships](#entityrelationships)

Returns an array of relationship description objects, containing named relationships that represents each [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) relationship available for this entity.

**See Also:** [Relationship Description Object](scripting-api-reference-project-entity.html#relationship-description-object)
