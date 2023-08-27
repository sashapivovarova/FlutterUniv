// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/life_event.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3576010303391918986),
      name: 'LifeEvent',
      lastPropertyId: const IdUid(3, 5250116933101009874),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3052019779558899484),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(2, 4976947681271016744),
            name: 'count',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5250116933101009874),
            name: 'id',
            type: 6,
            flags: 1)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 3576010303391918986),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    LifeEvent: EntityDefinition<LifeEvent>(
        model: _entities[0],
        toOneRelations: (LifeEvent object) => [],
        toManyRelations: (LifeEvent object) => {},
        getId: (LifeEvent object) => object.id,
        setId: (LifeEvent object, int id) {
          object.id = id;
        },
        objectToFB: (LifeEvent object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(4);
          fbb.addOffset(0, titleOffset);
          fbb.addInt64(1, object.count);
          fbb.addInt64(2, object.id);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 4, '');
          final countParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final object = LifeEvent(title: titleParam, count: countParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [LifeEvent] entity fields to define ObjectBox queries.
class LifeEvent_ {
  /// see [LifeEvent.title]
  static final title =
      QueryStringProperty<LifeEvent>(_entities[0].properties[0]);

  /// see [LifeEvent.count]
  static final count =
      QueryIntegerProperty<LifeEvent>(_entities[0].properties[1]);

  /// see [LifeEvent.id]
  static final id = QueryIntegerProperty<LifeEvent>(_entities[0].properties[2]);
}
