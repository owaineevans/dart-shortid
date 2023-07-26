# ShortUid

A Dart package for generating short unique identifiers based on UUIDV4
and converting them back and forth. RFC 4122 compliant.

## Features

- Convert UUIDv4 to short unique identifier (SID) and vice versa.
- Generate random short unique identifiers.

## Usage

### Convert UUIDv4 to SID

```dart
import 'package:shortuid/shortuid.dart';

final uuidv4 = 'd07b31c0-54d9-44d4-993d-ef8101ee1dad';
final shortuid = ShortUid.from_uid(uuidv4);
```

### Convert SID to UUIDv4

```dart
import 'package:shortuid/shortuid.dart';

final shortuid = '2n9c';
final uuidv4 = ShortUid.decode_to_uid(shortuid);
```

## Generate random SID
```dart
import 'package:shortuid/shortuid.dart';

final shortuid = ShortUid.create();
```

## Additional Information
This package is designed to play nice with the 
python : https://github.com/skorokithakis/shortuuid/tree/master 
and npm package : https://www.npmjs.com/package/short-uuid.

Most packages generated bad shortids that were not compatible with each other, issue is solved by using the same alphabet as the shortuuid python and short-uuid npm pacakge.