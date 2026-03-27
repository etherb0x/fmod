# Scripting API Reference | Project.ManagedObject

FMOD Studio User Manual 2.03.12

Project level data in Studio is represented as a graph of managed objects. A managed object is comprised of:

- **ManagedObject.id**: The unique identifier (GUID).
- **ManagedObject.entity**: A description of the object type (e.g. `Event`, `MixerGroup`, `Snapshot`).
- **ManagedObject.properties**: Each property is a simple data field (e.g. float, bool, string) with a value.
- **ManagedObject.relationships**: Links to other ManagedObjects, known as `destinations`. These can be `ToOne` or `ToMany`, and may or may not be ordered.

Beyond the generic interface presented for each ManagedObject, a number of extension functions are available for ManagedObjects of a particular project.Entity type.

The root managed object of a project can be retrieved using `studio.project.workspace`. Objects within a project of a particular project.Entity can be retrieved using `Entity.findInstances`.

## ManagedObject

### Properties

- **ManagedObject.entity** — A string representing the object's project.Entity type.
- **ManagedObject.id** — The object's unique ID. Immutable.
- **ManagedObject.isValid** — Returns whether an object is in a valid state. An object may become invalid if it is deleted or if it has a `null` value for one or more of its required entity.relationships.
- **ManagedObject.properties** — Provides access to an object's properties. Returns a ManagedPropertyMap. Immutable.
- **ManagedObject.%property_name%** — Provides access to a ManagedObject property's value. Setting the property (with the `=` operator) will set the property value.
- **ManagedObject.%relationship_name%** — Provides access to a ManagedObject relationship's destinations. Getting a `ToOne` relationship will return the single destination object (or `null` if unassigned). Getting a `ToMany` relationship returns an array of destinations (or empty array). Setting a `ToOne` relationship (with `=`) will set or replace current destinations. `ToMany` relationships cannot be modified with `=`.
- **ManagedObject.relationships** — Provides access to an object's relationships. Returns a ManagedRelationshipMap. Immutable.

### Methods

- **ManagedObject.document()** — Returns a string describing this ManagedObject's entity type. Example: `studio.project.workspace.mixer.masterBus.volume = 2` walks through Workspace's relationship to the global Mixer, then Mixer's relationship to MasterBus, then sets volume to 2 dB.
- **ManagedObject.dump()** — Logs all members. Useful for finding undocumented functionality.
- **ManagedObject.isOfExactType(entityName)** — Returns true if the object type matches the provided entity name. Does not include derived types.
- **ManagedObject.isOfType(entityName)** — Returns true if the object has an entity that matches the entity name, or is of a derived type.

## ManagedPropertyMap

### Properties

- **ManagedPropertyMap.parent** — The owning ManagedObject of the property map. Immutable.
- **ManagedPropertyMap.%property_name%** — Returns a ManagedProperty for the given property name. Immutable.

### Methods

- **ManagedPropertyMap.dump()** — Logs all members.

## ManagedProperty

### Properties

- **ManagedProperty.dataType** — The type of data stored by this managed property's value. Immutable.
- **ManagedProperty.defaultValue** — The default value that the ManagedProperty was initialized with. Immutable.
- **ManagedProperty.name** — The name of the property. Immutable.
- **ManagedProperty.parent** — The owning ManagedObject of the property. Immutable.
- **ManagedProperty.value** — The value stored by the property. Immutable.

### Methods

- **ManagedProperty.dump()** — Logs all members.
- **ManagedProperty.setValue(value)** — Sets the value stored by the property. Returns `true` if the operation succeeds, or `false` otherwise.

## ManagedRelationshipMap

### Properties

- **ManagedRelationshipMap.parent** — The owning ManagedObject of the relationship map. Immutable.
- **ManagedRelationshipMap.%relationship_name%** — Returns a ManagedRelationship for the given relationship name. Immutable.

### Methods

- **ManagedRelationshipMap.dump()** — Logs all members.

## ManagedRelationship

### Properties

- **ManagedRelationship.cardinality** — A string representing the object's cardinality. Either `ToOne` or `ToMany`. Immutable.
- **ManagedRelationship.destinations** — An array of ManagedObject destinations. Immutable.
- **ManagedRelationship.name** — The name of the relationship. Immutable.
- **ManagedRelationship.isOrdered** — A constant boolean value set to true if the relationship is ordered.
- **ManagedRelationship.parent** — The owning ManagedObject of the relationship. Immutable.

### Methods

- **ManagedRelationship.add(managedObject)** — Appends a new destination to a relationship. Replaces the current destination for a `ToOne` relationship. Returns `true` on success.
- **ManagedRelationship.dump()** — Logs all members.
- **ManagedRelationship.insert(index, managedObject)** — Inserts a new destination to a relationship at a given index. Index must be in range [0, destinations.length]. Returns `true` on success.
- **ManagedRelationship.remove(managedObject)** — Removes a destination from a relationship. Returns `true` on success.
