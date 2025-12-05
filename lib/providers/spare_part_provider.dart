import 'package:flutter/material.dart';
import '../models/spare_part_model.dart';

class SparePartProvider with ChangeNotifier {
  Map<String, String>? _selectedMotor;
  List<Catalog> _catalogs = [];
  int _selectedCatalogIndex = 0;

  final List<Map<String, String>> _motors = [
    {'name': 'Monster', 'image': 'assets/monster.png'},
    {'name': 'Multistrada', 'image': 'assets/multistrada.png'},
    {'name': 'Panigale', 'image': 'assets/panigale.png'},
    {'name': 'Diavel', 'image': 'assets/diavel.png'},
    {'name': 'Scrambler', 'image': 'assets/scrambler.png'},
    {'name': 'Supersport', 'image': 'assets/supersport.png'},
  ];

  List<Map<String, String>> get motors => _motors;
  Map<String, String>? get selectedMotor => _selectedMotor;
  List<Catalog> get catalogs => _catalogs;
  int get selectedCatalogIndex => _selectedCatalogIndex;

  void selectMotor(Map<String, String> motor) {
    _selectedMotor = motor;
    _loadCatalogs();
    notifyListeners();
  }

  void clearSelectedMotor() {
    _selectedMotor = null;
    _catalogs = [];
    _selectedCatalogIndex = 0;
    notifyListeners();
  }

  void _loadCatalogs() {
    // Reset quantities when loading new catalogs
    for (var catalog in _catalogs) {
      for (var part in catalog.parts) {
        part.quantity = 0;
      }
    }

    if (_selectedMotor != null && _selectedMotor!['name'] == 'Monster') {
      _catalogs = [
        Catalog(
          name: 'STAND FOR DUCATI MONSTER',
          image: 'assets/stand_monster.png',
          parts: [
            SparePart(
              name: 'BRACKET, SIDE STAND',
              partNumber: '55621241AA',
              price: 1620100,
            ),
            SparePart(
              name: 'SCREW TCEIF M10X25',
              partNumber: '77110431A',
              price: 73780,
            ),
            SparePart(
              name: 'SIDE STAND',
              partNumber: '55611151BA',
              price: 1913860,
            ),
            SparePart(name: 'SCREW', partNumber: '77917241AA', price: 35870),
            SparePart(
              name: 'SWITCH, STAND',
              partNumber: '53910351A',
              price: 1028500,
            ),
            SparePart(
              name: 'INNER SPRING',
              partNumber: '79915081A',
              price: 115600,
            ),
            SparePart(
              name: 'COMPLETE SPRING',
              partNumber: '79921602A',
              price: 241400,
            ),
            SparePart(name: 'NUT MB', partNumber: '749411288', price: 35870),
            SparePart(
              name: 'AXLE, SIDE STAND',
              partNumber: '82114632BB',
              price: 147560,
            ),
          ],
        ),
        Catalog(
          name: 'SPROCKETS & DRIVE CHAIN',
          image: 'assets/sprockets_drive_chain_monster.jpg',
          parts: [
            SparePart(
              name: 'SPROCKET T15',
              partNumber: '44910821A',
              price: 495720,
            ),
            SparePart(
              name: 'CHAIN PINION COVER',
              partNumber: '4601L084A',
              price: 127500,
            ),
            SparePart(
              name: 'OPEN CHAIN',
              partNumber: '676409624',
              price: 2023850,
            ),
            SparePart(
              name: 'CHAIN LINK',
              partNumber: '67740201A',
              price: 175100,
            ),
            SparePart(name: 'SCREW', partNumber: '771103918', price: 35870),
            SparePart(name: 'NUT', partNumber: '75010071A', price: 226270),
            SparePart(
              name: 'WASHER, LOCK',
              partNumber: '85110041A',
              price: 35870,
            ),
            SparePart(
              name: 'CHAIN ADJUSTMENT STICKER',
              partNumber: '43314991A',
              price: 191590,
            ),
            SparePart(
              name: 'FINAL DRIVE KIT',
              partNumber: '67621321A',
              price: 4131850,
            ),
          ],
        ),
        Catalog(
          name: 'STEERING ASSEMBLY',
          image: 'assets/steering_assembly.jpg',
          parts: [
            SparePart(
              name: 'STEERING HEAD',
              partNumber: '34111801BA',
              price: 2764540,
            ),
            SparePart(
              name: 'STEERING HEAD BASE',
              partNumber: '342P1192BA',
              price: 4465900,
            ),
            SparePart(
              name: 'HANDLEBAR BRACKET, UPPER',
              partNumber: '36015901AA',
              price: 604520,
            ),
            SparePart(
              name: 'HANDLEBAR BRACKET, UPPER',
              partNumber: '36015911AA',
              price: 604520,
            ),
            SparePart(
              name: 'HOLDER, HANDLE LOWER',
              partNumber: '36015951AA',
              price: 0,
            ),
            SparePart(
              name: 'VIBRATION DAMPER',
              partNumber: '70011141A',
              price: 215220,
            ),
            SparePart(
              name: 'THREAD, STEERING HEAD TOP',
              partNumber: '70310131A',
              price: 826200,
            ),
            SparePart(name: 'NUT', partNumber: '74750071A', price: 17000),
            SparePart(
              name: 'THREADED DOWEL STEI M8X25',
              partNumber: '77850281A',
              price: 17000,
            ),
            SparePart(name: 'NUT', partNumber: '74840241AB', price: 17000),
            SparePart(name: 'SCREW', partNumber: '771572738', price: 35870),
            SparePart(
              name: 'SCREW TCEIF M8X22',
              partNumber: '77157248C',
              price: 161330,
            ),
            SparePart(name: 'SCREW', partNumber: '77157253B', price: 35870),
            SparePart(
              name: 'SCREW TBEIF M6X12',
              partNumber: '77240403C',
              price: 0,
            ),
            SparePart(name: 'SCREW', partNumber: '77159414B', price: 92650),
            SparePart(name: 'CLAMP', partNumber: '74140331A', price: 54910),
            SparePart(
              name: 'WASHER 10.5X28X1.5',
              partNumber: '85210491B',
              price: 99280,
            ),
            SparePart(name: 'WASHER', partNumber: '85211031AB', price: 54910),
            SparePart(
              name: 'WASHER 10.5X18X1.6',
              partNumber: '85250401A',
              price: 17000,
            ),
            SparePart(
              name: 'SEAL RING',
              partNumber: '93010041B',
              price: 104040,
            ),
            SparePart(
              name: 'BEARING, STEERING NTN SF07A17P',
              partNumber: '70241232A',
              price: 771460,
            ),
          ],
        ),
        Catalog(
          name: 'FRONT BRAKE SYSTEM',
          image: 'assets/front_brake_monster.png',
          parts: [
            SparePart(
              name: 'RIGHT FRONT BRAKE CALIPER',
              partNumber: '61041302C',
              price: 5085550,
            ),
            SparePart(
              name: 'LEFT FRONT BRAKE CALIPER',
              partNumber: '61041292C',
              price: 5085550,
            ),
            SparePart(
              name: 'SCREW M 10 X 60',
              partNumber: '77913311D',
              price: 225420,
            ),
            SparePart(
              name: 'HOSE, FRONT BRAKE CALIPER-CALIPER',
              partNumber: '61810871A',
              price: 950300,
            ),
            SparePart(
              name: 'VALVE, BREATHER',
              partNumber: '18710021A',
              price: 35870,
            ),
            SparePart(
              name: 'BOLT, BRAKE HOSE',
              partNumber: '77914651A',
              price: 240720,
            ),
            SparePart(
              name: 'BOLT, BRAKE HOSE',
              partNumber: '77913971A',
              price: 180710,
            ),
            SparePart(
              name: 'DUST COVER',
              partNumber: '61240052A',
              price: 263500,
            ),
            SparePart(
              name: 'WASHER 10X14X1',
              partNumber: '85250241A',
              price: 17000,
            ),
            SparePart(
              name: 'SPARE PIN AND SPRING',
              partNumber: '61240511A',
              price: 304300,
            ),
            SparePart(
              name: 'FRONT BRAKE PADS SET',
              partNumber: '61341021A',
              price: 1436500,
            ),
          ],
        ),
      ];
    } else if (_selectedMotor!['name'] == 'Multistrada') {
      _catalogs = [
        Catalog(
          name: 'STAND FOR DUCATI MULTISTRADA',
          image: 'assets/stand_multistrada.png',
          parts: [
            SparePart(
              name: 'SIDE STAND',
              partNumber: '55611161A',
              price: 2100000,
            ),
            SparePart(
              name: 'SIDE STAND BRACKET',
              partNumber: '55621251B',
              price: 1850000,
            ),
            SparePart(
              name: 'STAND SENSOR',
              partNumber: '53910361B',
              price: 1250000,
            ),
            SparePart(name: 'SPRING', partNumber: '79915091A', price: 150000),
            SparePart(
              name: 'SCREW M10X30',
              partNumber: '77110441A',
              price: 85000,
            ),
            SparePart(name: 'NUT M10', partNumber: '74941131A', price: 45000),
            SparePart(
              name: 'STAND PIVOT PIN',
              partNumber: '82114641A',
              price: 180000,
            ),
          ],
        ),
        Catalog(
          name: 'SPROCKETS & DRIVE CHAIN',
          image: 'assets/sprockets_drive_chain_multistrada.png',
          parts: [
            SparePart(
              name: 'FRONT SPROCKET Z15',
              partNumber: '44910831A',
              price: 650000,
            ),
            SparePart(
              name: 'REAR SPROCKET Z42',
              partNumber: '45010841A',
              price: 1850000,
            ),
            SparePart(
              name: 'DRIVE CHAIN',
              partNumber: '67640971A',
              price: 2500000,
            ),
            SparePart(
              name: 'CHAIN LINK',
              partNumber: '67740211A',
              price: 200000,
            ),
            SparePart(
              name: 'SPROCKET NUT',
              partNumber: '75010081A',
              price: 250000,
            ),
            SparePart(
              name: 'LOCK WASHER',
              partNumber: '85110051A',
              price: 50000,
            ),
            SparePart(
              name: 'CUSH DRIVE RUBBER',
              partNumber: '70410011A',
              price: 450000,
            ),
            SparePart(
              name: 'REAR SPROCKET FLANGE',
              partNumber: '70510021A',
              price: 1500000,
            ),
            SparePart(
              name: 'FLANGE NUT',
              partNumber: '74840251A',
              price: 120000,
            ),
            SparePart(
              name: 'SCREW M8X20',
              partNumber: '77850291A',
              price: 30000,
            ),
            SparePart(
              name: 'CHAIN SLIDER',
              partNumber: '4601L091A',
              price: 350000,
            ),
          ],
        ),
        Catalog(
          name: 'FRONT FORK',
          image: 'assets/front_fork_multistrada.png',
          parts: [
            SparePart(
              name: 'FORK LEG, LEFT',
              partNumber: '34420211A',
              price: 8500000,
            ),
            SparePart(
              name: 'FORK LEG, RIGHT',
              partNumber: '34420221A',
              price: 8500000,
            ),
            SparePart(
              name: 'FORK SPRING',
              partNumber: '34510111A',
              price: 1200000,
            ),
            SparePart(name: 'TOP CAP', partNumber: '34610121A', price: 750000),
            SparePart(
              name: 'COMPRESSION VALVE',
              partNumber: '34710131A',
              price: 1800000,
            ),
            SparePart(
              name: 'REBOUND VALVE',
              partNumber: '34810141A',
              price: 1800000,
            ),
            SparePart(
              name: 'FORK SEAL',
              partNumber: '93010051A',
              price: 250000,
            ),
            SparePart(
              name: 'DUST SEAL',
              partNumber: '93010061A',
              price: 200000,
            ),
            SparePart(
              name: 'BUSHING, INNER',
              partNumber: '70241241A',
              price: 300000,
            ),
            SparePart(
              name: 'BUSHING, OUTER',
              partNumber: '70241251A',
              price: 350000,
            ),
            SparePart(
              name: 'AXLE CLAMP',
              partNumber: '82114651A',
              price: 950000,
            ),
            SparePart(
              name: 'BLEEDER SCREW',
              partNumber: '77157281A',
              price: 150000,
            ),
          ],
        ),
        Catalog(
          name: 'FRONT FORK STEM',
          image: 'assets/front_fork_stem_multistrada.png',
          parts: [
            SparePart(
              name: 'STEERING STEM',
              partNumber: '34111811A',
              price: 4500000,
            ),
            SparePart(
              name: 'TOP YOKE',
              partNumber: '36015921A',
              price: 3500000,
            ),
            SparePart(
              name: 'BOTTOM YOKE',
              partNumber: '36015931A',
              price: 4200000,
            ),
            SparePart(
              name: 'STEERING HEAD BEARING, UPPER',
              partNumber: '70241261A',
              price: 650000,
            ),
            SparePart(
              name: 'STEERING HEAD BEARING, LOWER',
              partNumber: '70241271A',
              price: 700000,
            ),
            SparePart(
              name: 'BEARING SEAL, UPPER',
              partNumber: '93010071A',
              price: 150000,
            ),
            SparePart(
              name: 'BEARING SEAL, LOWER',
              partNumber: '93010081A',
              price: 180000,
            ),
            SparePart(name: 'LOCK NUT', partNumber: '74840261A', price: 250000),
            SparePart(
              name: 'ADJUSTING NUT',
              partNumber: '74840271A',
              price: 300000,
            ),
            SparePart(
              name: 'HANDLEBAR RISER, LEFT',
              partNumber: '36015961A',
              price: 1200000,
            ),
            SparePart(
              name: 'HANDLEBAR RISER, RIGHT',
              partNumber: '36015971A',
              price: 1200000,
            ),
            SparePart(
              name: 'RISER CLAMP',
              partNumber: '36015981A',
              price: 850000,
            ),
            SparePart(
              name: 'SCREW M10X50',
              partNumber: '77110451A',
              price: 95000,
            ),
            SparePart(name: 'WASHER', partNumber: '85211041A', price: 45000),
            SparePart(
              name: 'HANDLEBAR',
              partNumber: '36015991A',
              price: 2800000,
            ),
          ],
        ),
      ];
    } else if (_selectedMotor!['name'] == 'Panigale') {
      _catalogs = [
        Catalog(
          name: 'SPROCKETS & DRIVE CHAIN',
          image: 'assets/sprockets_drive_chain_panigale.png',
          parts: [
            SparePart(
              name: 'FRONT SPROCKET Z16',
              partNumber: '44910841A',
              price: 750000,
            ),
            SparePart(
              name: 'REAR SPROCKET Z39',
              partNumber: '45010851A',
              price: 2200000,
            ),
            SparePart(
              name: 'DRIVE CHAIN',
              partNumber: '67640981A',
              price: 3200000,
            ),
            SparePart(
              name: 'CHAIN LINK',
              partNumber: '67740221A',
              price: 250000,
            ),
            SparePart(
              name: 'SPROCKET NUT',
              partNumber: '75010091A',
              price: 300000,
            ),
            SparePart(
              name: 'LOCK WASHER',
              partNumber: '85110061A',
              price: 60000,
            ),
            SparePart(
              name: 'CUSH DRIVE RUBBER',
              partNumber: '70410021A',
              price: 550000,
            ),
            SparePart(
              name: 'REAR SPROCKET FLANGE',
              partNumber: '70510031A',
              price: 1800000,
            ),
            SparePart(
              name: 'FLANGE NUT',
              partNumber: '74840281A',
              price: 150000,
            ),
            SparePart(
              name: 'SCREW M8X25',
              partNumber: '77850301A',
              price: 40000,
            ),
            SparePart(
              name: 'CHAIN SLIDER',
              partNumber: '4601L101A',
              price: 450000,
            ),
            SparePart(
              name: 'CHAIN GUARD',
              partNumber: '4601L111A',
              price: 650000,
            ),
            SparePart(
              name: 'SWINGARM PIN',
              partNumber: '82114661A',
              price: 1200000,
            ),
            SparePart(
              name: 'ECCENTRIC HUB',
              partNumber: '82114671A',
              price: 3500000,
            ),
            SparePart(
              name: 'HUB BEARING',
              partNumber: '70241281A',
              price: 950000,
            ),
            SparePart(name: 'HUB SEAL', partNumber: '93010091A', price: 250000),
          ],
        ),
        Catalog(
          name: 'STAND',
          image: 'assets/stand_panigale.png',
          parts: [
            SparePart(
              name: 'SIDE STAND',
              partNumber: '55611171A',
              price: 2500000,
            ),
            SparePart(
              name: 'SIDE STAND BRACKET',
              partNumber: '55621261B',
              price: 2100000,
            ),
            SparePart(
              name: 'STAND SENSOR',
              partNumber: '53910371B',
              price: 1500000,
            ),
            SparePart(name: 'SPRING', partNumber: '79915101A', price: 180000),
            SparePart(
              name: 'SCREW M10X35',
              partNumber: '77110461A',
              price: 100000,
            ),
            SparePart(name: 'NUT M10', partNumber: '74941141A', price: 50000),
            SparePart(
              name: 'STAND PIVOT PIN',
              partNumber: '82114681A',
              price: 220000,
            ),
            SparePart(
              name: 'STAND PLATE',
              partNumber: '55611181A',
              price: 350000,
            ),
            SparePart(
              name: 'SCREW M8X20',
              partNumber: '77850291A',
              price: 30000,
            ),
            SparePart(name: 'WASHER', partNumber: '85211051A', price: 25000),
            SparePart(
              name: 'RUBBER PAD',
              partNumber: '70011151A',
              price: 150000,
            ),
            SparePart(name: 'CIRCLIP', partNumber: '85110071A', price: 45000),
            SparePart(
              name: 'STAND SWITCH COVER',
              partNumber: '4601L121A',
              price: 280000,
            ),
          ],
        ),
        Catalog(
          name: 'STEERING ASSEMBLY',
          image: 'assets/steering_assembly_panigale.png',
          parts: [
            SparePart(
              name: 'STEERING DAMPER',
              partNumber: '34910151A',
              price: 5500000,
            ),
            SparePart(
              name: 'TOP YOKE',
              partNumber: '36016001A',
              price: 4500000,
            ),
            SparePart(
              name: 'BOTTOM YOKE',
              partNumber: '36016011A',
              price: 5200000,
            ),
            SparePart(
              name: 'STEERING STEM',
              partNumber: '34111821A',
              price: 6500000,
            ),
            SparePart(
              name: 'STEERING HEAD BEARING, UPPER',
              partNumber: '70241291A',
              price: 850000,
            ),
            SparePart(
              name: 'STEERING HEAD BEARING, LOWER',
              partNumber: '70241301A',
              price: 900000,
            ),
            SparePart(
              name: 'BEARING SEAL, UPPER',
              partNumber: '93010101A',
              price: 180000,
            ),
            SparePart(
              name: 'BEARING SEAL, LOWER',
              partNumber: '93010111A',
              price: 200000,
            ),
            SparePart(name: 'LOCK NUT', partNumber: '74840291A', price: 350000),
            SparePart(
              name: 'ADJUSTING NUT',
              partNumber: '74840301A',
              price: 400000,
            ),
            SparePart(
              name: 'CLIP-ON, LEFT',
              partNumber: '36016021A',
              price: 2800000,
            ),
            SparePart(
              name: 'CLIP-ON, RIGHT',
              partNumber: '36016031A',
              price: 2800000,
            ),
            SparePart(
              name: 'THROTTLE CONTROL',
              partNumber: '65010161A',
              price: 3500000,
            ),
            SparePart(
              name: 'SWITCH, LEFT',
              partNumber: '53910381B',
              price: 2500000,
            ),
          ],
        ),
        Catalog(
          name: 'FRONT FORK',
          image: 'assets/front_fork_panigale.png',
          parts: [
            SparePart(
              name: 'FORK LEG, LEFT',
              partNumber: '34420231A',
              price: 12500000,
            ),
            SparePart(
              name: 'FORK LEG, RIGHT',
              partNumber: '34420241A',
              price: 12500000,
            ),
            SparePart(
              name: 'FORK SPRING',
              partNumber: '34510121A',
              price: 1800000,
            ),
            SparePart(name: 'TOP CAP', partNumber: '34610131A', price: 1200000),
            SparePart(
              name: 'COMPRESSION VALVE',
              partNumber: '34710141A',
              price: 2500000,
            ),
            SparePart(
              name: 'REBOUND VALVE',
              partNumber: '34810151A',
              price: 2500000,
            ),
            SparePart(
              name: 'FORK SEAL',
              partNumber: '93010121A',
              price: 350000,
            ),
            SparePart(
              name: 'DUST SEAL',
              partNumber: '93010131A',
              price: 300000,
            ),
            SparePart(
              name: 'BUSHING, INNER',
              partNumber: '70241311A',
              price: 450000,
            ),
            SparePart(
              name: 'BUSHING, OUTER',
              partNumber: '70241321A',
              price: 500000,
            ),
            SparePart(
              name: 'AXLE CLAMP',
              partNumber: '82114691A',
              price: 1500000,
            ),
            SparePart(
              name: 'BLEEDER SCREW',
              partNumber: '77157291A',
              price: 200000,
            ),
            SparePart(
              name: 'FRONT AXLE',
              partNumber: '82114701A',
              price: 1800000,
            ),
            SparePart(name: 'AXLE NUT', partNumber: '74840311A', price: 450000),
            SparePart(
              name: 'ABS SENSOR',
              partNumber: '53910391B',
              price: 1800000,
            ),
            SparePart(
              name: 'SENSOR BRACKET',
              partNumber: '55621271B',
              price: 650000,
            ),
          ],
        ),
      ];
    } else if (_selectedMotor!['name'] == 'Diavel') {
      _catalogs = [
        Catalog(
          name: 'SPROCKETS & DRIVE CHAIN',
          image: 'assets/sprockets_drive_chain_diavel.png',
          parts: [
            SparePart(
              name: 'FRONT SPROCKET Z15',
              partNumber: '44910851A',
              price: 680000,
            ),
            SparePart(
              name: 'REAR SPROCKET Z44',
              partNumber: '45010861A',
              price: 2100000,
            ),
            SparePart(
              name: 'DRIVE CHAIN',
              partNumber: '67640991A',
              price: 2800000,
            ),
            SparePart(
              name: 'CHAIN LINK',
              partNumber: '67740231A',
              price: 220000,
            ),
            SparePart(
              name: 'SPROCKET NUT',
              partNumber: '75010101A',
              price: 280000,
            ),
            SparePart(
              name: 'LOCK WASHER',
              partNumber: '85110081A',
              price: 55000,
            ),
            SparePart(
              name: 'CUSH DRIVE RUBBER',
              partNumber: '70410031A',
              price: 500000,
            ),
            SparePart(
              name: 'REAR SPROCKET FLANGE',
              partNumber: '70510041A',
              price: 1650000,
            ),
            SparePart(
              name: 'FLANGE NUT',
              partNumber: '74840321A',
              price: 140000,
            ),
            SparePart(
              name: 'SCREW M8X22',
              partNumber: '77850311A',
              price: 35000,
            ),
            SparePart(
              name: 'CHAIN SLIDER',
              partNumber: '4601L131A',
              price: 400000,
            ),
            SparePart(
              name: 'CHAIN GUARD',
              partNumber: '4601L141A',
              price: 580000,
            ),
            SparePart(
              name: 'SWINGARM PIN',
              partNumber: '82114711A',
              price: 1100000,
            ),
            SparePart(
              name: 'ECCENTRIC HUB',
              partNumber: '82114721A',
              price: 3200000,
            ),
            SparePart(
              name: 'HUB BEARING',
              partNumber: '70241331A',
              price: 850000,
            ),
          ],
        ),
        Catalog(
          name: 'STAND',
          image: 'assets/stand_diavel.png',
          parts: [
            SparePart(
              name: 'SIDE STAND',
              partNumber: '55611191A',
              price: 2300000,
            ),
            SparePart(
              name: 'SIDE STAND BRACKET',
              partNumber: '55621281B',
              price: 1950000,
            ),
            SparePart(
              name: 'STAND SENSOR',
              partNumber: '53910401B',
              price: 1400000,
            ),
            SparePart(name: 'SPRING', partNumber: '79915111A', price: 170000),
            SparePart(
              name: 'SCREW M10X32',
              partNumber: '77110471A',
              price: 95000,
            ),
            SparePart(name: 'NUT M10', partNumber: '74941151A', price: 48000),
            SparePart(
              name: 'STAND PIVOT PIN',
              partNumber: '82114731A',
              price: 200000,
            ),
            SparePart(
              name: 'STAND PLATE',
              partNumber: '55611201A',
              price: 320000,
            ),
            SparePart(
              name: 'RUBBER PAD',
              partNumber: '70011161A',
              price: 140000,
            ),
          ],
        ),
        Catalog(
          name: 'STEERING ASSEMBLY',
          image: 'assets/steering_assembly_diavel.png',
          parts: [
            SparePart(
              name: 'STEERING DAMPER',
              partNumber: '34910161A',
              price: 5200000,
            ),
            SparePart(
              name: 'TOP YOKE',
              partNumber: '36016041A',
              price: 4200000,
            ),
            SparePart(
              name: 'BOTTOM YOKE',
              partNumber: '36016051A',
              price: 4800000,
            ),
            SparePart(
              name: 'STEERING STEM',
              partNumber: '34111831A',
              price: 6000000,
            ),
            SparePart(
              name: 'STEERING HEAD BEARING, UPPER',
              partNumber: '70241341A',
              price: 800000,
            ),
            SparePart(
              name: 'STEERING HEAD BEARING, LOWER',
              partNumber: '70241351A',
              price: 850000,
            ),
            SparePart(
              name: 'BEARING SEAL, UPPER',
              partNumber: '93010141A',
              price: 170000,
            ),
            SparePart(
              name: 'BEARING SEAL, LOWER',
              partNumber: '93010151A',
              price: 190000,
            ),
            SparePart(name: 'LOCK NUT', partNumber: '74840331A', price: 330000),
            SparePart(
              name: 'ADJUSTING NUT',
              partNumber: '74840341A',
              price: 380000,
            ),
            SparePart(
              name: 'HANDLEBAR, LEFT',
              partNumber: '36016061A',
              price: 2500000,
            ),
            SparePart(
              name: 'HANDLEBAR, RIGHT',
              partNumber: '36016071A',
              price: 2500000,
            ),
            SparePart(
              name: 'HANDLEBAR CLAMP',
              partNumber: '36016081A',
              price: 950000,
            ),
            SparePart(
              name: 'THROTTLE CONTROL',
              partNumber: '65010171A',
              price: 3200000,
            ),
            SparePart(
              name: 'SWITCH, LEFT',
              partNumber: '53910411B',
              price: 2300000,
            ),
            SparePart(
              name: 'SWITCH, RIGHT',
              partNumber: '53910421B',
              price: 2300000,
            ),
            SparePart(
              name: 'GRIP, LEFT',
              partNumber: '36016091A',
              price: 450000,
            ),
            SparePart(
              name: 'GRIP, RIGHT',
              partNumber: '36016101A',
              price: 450000,
            ),
            SparePart(
              name: 'BAR END WEIGHT, LEFT',
              partNumber: '36016111A',
              price: 650000,
            ),
            SparePart(
              name: 'BAR END WEIGHT, RIGHT',
              partNumber: '36016121A',
              price: 650000,
            ),
          ],
        ),
        Catalog(
          name: 'FRONT FORK',
          image: 'assets/front_fork_diavel.png',
          parts: [
            SparePart(
              name: 'FORK LEG, LEFT',
              partNumber: '34420251A',
              price: 11500000,
            ),
            SparePart(
              name: 'FORK LEG, RIGHT',
              partNumber: '34420261A',
              price: 11500000,
            ),
            SparePart(
              name: 'FORK SPRING',
              partNumber: '34510131A',
              price: 1650000,
            ),
            SparePart(name: 'TOP CAP', partNumber: '34610141A', price: 1100000),
            SparePart(
              name: 'COMPRESSION VALVE',
              partNumber: '34710151A',
              price: 2300000,
            ),
            SparePart(
              name: 'REBOUND VALVE',
              partNumber: '34810161A',
              price: 2300000,
            ),
            SparePart(
              name: 'FORK SEAL',
              partNumber: '93010161A',
              price: 320000,
            ),
            SparePart(
              name: 'DUST SEAL',
              partNumber: '93010171A',
              price: 280000,
            ),
            SparePart(
              name: 'BUSHING, INNER',
              partNumber: '70241361A',
              price: 420000,
            ),
            SparePart(
              name: 'BUSHING, OUTER',
              partNumber: '70241371A',
              price: 480000,
            ),
            SparePart(
              name: 'AXLE CLAMP',
              partNumber: '82114741A',
              price: 1350000,
            ),
            SparePart(
              name: 'BLEEDER SCREW',
              partNumber: '77157301A',
              price: 180000,
            ),
            SparePart(
              name: 'FRONT AXLE',
              partNumber: '82114751A',
              price: 1650000,
            ),
          ],
        ),
      ];
    } else if (_selectedMotor!['name'] == 'Scrambler') {
      _catalogs = [
        Catalog(
          name: 'SPROCKETS & DRIVE CHAIN',
          image: 'assets/sprockets_drive_chain_scrambler(9).png',
          parts: [
            SparePart(
              name: 'FRONT SPROCKET Z14',
              partNumber: '44910861A',
              price: 580000,
            ),
            SparePart(
              name: 'REAR SPROCKET Z46',
              partNumber: '45010871A',
              price: 1950000,
            ),
            SparePart(
              name: 'DRIVE CHAIN',
              partNumber: '67641001A',
              price: 2400000,
            ),
            SparePart(
              name: 'CHAIN LINK',
              partNumber: '67740241A',
              price: 190000,
            ),
            SparePart(
              name: 'SPROCKET NUT',
              partNumber: '75010111A',
              price: 260000,
            ),
            SparePart(
              name: 'LOCK WASHER',
              partNumber: '85110091A',
              price: 52000,
            ),
            SparePart(
              name: 'CHAIN SLIDER',
              partNumber: '4601L151A',
              price: 380000,
            ),
            SparePart(
              name: 'CHAIN GUARD',
              partNumber: '4601L161A',
              price: 520000,
            ),
            SparePart(
              name: 'SWINGARM PIN',
              partNumber: '82114761A',
              price: 1050000,
            ),
          ],
        ),
        Catalog(
          name: 'STAND',
          image: 'assets/stand_scrambler(12).png',
          parts: [
            SparePart(
              name: 'SIDE STAND',
              partNumber: '55611211A',
              price: 2050000,
            ),
            SparePart(
              name: 'SIDE STAND BRACKET',
              partNumber: '55621291B',
              price: 1750000,
            ),
            SparePart(
              name: 'STAND SENSOR',
              partNumber: '53910431B',
              price: 1200000,
            ),
            SparePart(name: 'SPRING', partNumber: '79915121A', price: 160000),
            SparePart(
              name: 'SCREW M10X28',
              partNumber: '77110481A',
              price: 88000,
            ),
            SparePart(name: 'NUT M10', partNumber: '74941161A', price: 42000),
            SparePart(
              name: 'STAND PIVOT PIN',
              partNumber: '82114771A',
              price: 185000,
            ),
            SparePart(
              name: 'STAND PLATE',
              partNumber: '55611221A',
              price: 300000,
            ),
            SparePart(
              name: 'RUBBER PAD',
              partNumber: '70011171A',
              price: 130000,
            ),
            SparePart(name: 'WASHER', partNumber: '85211061A', price: 28000),
            SparePart(name: 'CIRCLIP', partNumber: '85110101A', price: 40000),
            SparePart(
              name: 'STAND SWITCH COVER',
              partNumber: '4601L171A',
              price: 250000,
            ),
          ],
        ),
        Catalog(
          name: 'STEERING ASSEMBLY',
          image: 'assets/steering_assembly_scrambler(18).png',
          parts: [
            SparePart(
              name: 'TOP YOKE',
              partNumber: '36016131A',
              price: 3800000,
            ),
            SparePart(
              name: 'BOTTOM YOKE',
              partNumber: '36016141A',
              price: 4200000,
            ),
            SparePart(
              name: 'STEERING STEM',
              partNumber: '34111841A',
              price: 5500000,
            ),
            SparePart(
              name: 'STEERING HEAD BEARING, UPPER',
              partNumber: '70241381A',
              price: 720000,
            ),
            SparePart(
              name: 'STEERING HEAD BEARING, LOWER',
              partNumber: '70241391A',
              price: 780000,
            ),
            SparePart(
              name: 'BEARING SEAL, UPPER',
              partNumber: '93010181A',
              price: 160000,
            ),
            SparePart(
              name: 'BEARING SEAL, LOWER',
              partNumber: '93010191A',
              price: 175000,
            ),
            SparePart(name: 'LOCK NUT', partNumber: '74840351A', price: 300000),
            SparePart(
              name: 'ADJUSTING NUT',
              partNumber: '74840361A',
              price: 350000,
            ),
            SparePart(
              name: 'HANDLEBAR',
              partNumber: '36016151A',
              price: 2400000,
            ),
            SparePart(
              name: 'HANDLEBAR CLAMP',
              partNumber: '36016161A',
              price: 850000,
            ),
            SparePart(
              name: 'THROTTLE CONTROL',
              partNumber: '65010181A',
              price: 2900000,
            ),
            SparePart(
              name: 'SWITCH, LEFT',
              partNumber: '53910441B',
              price: 2100000,
            ),
            SparePart(
              name: 'SWITCH, RIGHT',
              partNumber: '53910451B',
              price: 2100000,
            ),
            SparePart(
              name: 'GRIP, LEFT',
              partNumber: '36016171A',
              price: 380000,
            ),
            SparePart(
              name: 'GRIP, RIGHT',
              partNumber: '36016181A',
              price: 380000,
            ),
            SparePart(
              name: 'BAR END WEIGHT, LEFT',
              partNumber: '36016191A',
              price: 550000,
            ),
            SparePart(
              name: 'BAR END WEIGHT, RIGHT',
              partNumber: '36016201A',
              price: 550000,
            ),
          ],
        ),
        Catalog(
          name: 'FRONT FORK',
          image: 'assets/front_fork_scrambler(27).png',
          parts: [
            SparePart(
              name: 'FORK LEG, LEFT',
              partNumber: '34420271A',
              price: 9800000,
            ),
            SparePart(
              name: 'FORK LEG, RIGHT',
              partNumber: '34420281A',
              price: 9800000,
            ),
            SparePart(
              name: 'FORK SPRING',
              partNumber: '34510141A',
              price: 1450000,
            ),
            SparePart(name: 'TOP CAP', partNumber: '34610151A', price: 950000),
            SparePart(
              name: 'COMPRESSION VALVE',
              partNumber: '34710161A',
              price: 2000000,
            ),
            SparePart(
              name: 'REBOUND VALVE',
              partNumber: '34810171A',
              price: 2000000,
            ),
            SparePart(
              name: 'FORK SEAL',
              partNumber: '93010201A',
              price: 280000,
            ),
            SparePart(
              name: 'DUST SEAL',
              partNumber: '93010211A',
              price: 240000,
            ),
            SparePart(
              name: 'BUSHING, INNER',
              partNumber: '70241401A',
              price: 380000,
            ),
            SparePart(
              name: 'BUSHING, OUTER',
              partNumber: '70241411A',
              price: 420000,
            ),
            SparePart(
              name: 'AXLE CLAMP',
              partNumber: '82114781A',
              price: 1200000,
            ),
            SparePart(
              name: 'BLEEDER SCREW',
              partNumber: '77157311A',
              price: 160000,
            ),
            SparePart(
              name: 'FRONT AXLE',
              partNumber: '82114791A',
              price: 1500000,
            ),
            SparePart(name: 'AXLE NUT', partNumber: '74840371A', price: 380000),
            SparePart(
              name: 'FORK BOOT, LEFT',
              partNumber: '34420291A',
              price: 450000,
            ),
            SparePart(
              name: 'FORK BOOT, RIGHT',
              partNumber: '34420301A',
              price: 450000,
            ),
            SparePart(
              name: 'BOOT CLAMP, UPPER',
              partNumber: '74140341A',
              price: 85000,
            ),
            SparePart(
              name: 'BOOT CLAMP, LOWER',
              partNumber: '74140351A',
              price: 85000,
            ),
            SparePart(
              name: 'FORK PROTECTOR, LEFT',
              partNumber: '34420311A',
              price: 650000,
            ),
            SparePart(
              name: 'FORK PROTECTOR, RIGHT',
              partNumber: '34420321A',
              price: 650000,
            ),
            SparePart(
              name: 'PROTECTOR SCREW',
              partNumber: '77157321A',
              price: 120000,
            ),
            SparePart(
              name: 'FORK OIL SEAL HOLDER',
              partNumber: '34420331A',
              price: 550000,
            ),
            SparePart(
              name: 'SEAL HOLDER O-RING',
              partNumber: '93010221A',
              price: 95000,
            ),
            SparePart(
              name: 'FORK DAMPER PISTON',
              partNumber: '34420341A',
              price: 1250000,
            ),
            SparePart(
              name: 'PISTON RING',
              partNumber: '93010231A',
              price: 180000,
            ),
            SparePart(
              name: 'FORK GUARD BRACKET',
              partNumber: '34420351A',
              price: 420000,
            ),
            SparePart(
              name: 'BRACKET BOLT',
              partNumber: '77157331A',
              price: 75000,
            ),
          ],
        ),
      ];
    } else if (_selectedMotor!['name'] == 'Supersport') {
      _catalogs = [
        Catalog(
          name: 'EXHAUST SYSTEM',
          image: 'assets/exhaust_system_supersport(53).png',
          parts: [
            SparePart(
              name: 'EXHAUST PIPE, FRONT CYLINDER',
              partNumber: '57010201A',
              price: 8500000,
            ),
            SparePart(
              name: 'EXHAUST PIPE, REAR CYLINDER',
              partNumber: '57010211A',
              price: 8500000,
            ),
            SparePart(
              name: 'MUFFLER ASSEMBLY',
              partNumber: '57110221A',
              price: 15000000,
            ),
            SparePart(
              name: 'EXHAUST GASKET, FRONT',
              partNumber: '79210311A',
              price: 180000,
            ),
            SparePart(
              name: 'EXHAUST GASKET, REAR',
              partNumber: '79210321A',
              price: 180000,
            ),
            SparePart(
              name: 'EXHAUST CLAMP, FRONT',
              partNumber: '74140361A',
              price: 250000,
            ),
            SparePart(
              name: 'EXHAUST CLAMP, REAR',
              partNumber: '74140371A',
              price: 250000,
            ),
            SparePart(
              name: 'MUFFLER BRACKET',
              partNumber: '57210231A',
              price: 850000,
            ),
            SparePart(
              name: 'BRACKET BOLT M8X30',
              partNumber: '77850321A',
              price: 45000,
            ),
            SparePart(
              name: 'MUFFLER SPRING',
              partNumber: '79915131A',
              price: 120000,
            ),
            SparePart(
              name: 'SPRING HOOK',
              partNumber: '77917251A',
              price: 65000,
            ),
            SparePart(
              name: 'HEAT SHIELD, FRONT',
              partNumber: '57310241A',
              price: 1250000,
            ),
            SparePart(
              name: 'HEAT SHIELD, REAR',
              partNumber: '57310251A',
              price: 1250000,
            ),
            SparePart(
              name: 'HEAT SHIELD SCREW',
              partNumber: '77157341A',
              price: 55000,
            ),
            SparePart(
              name: 'LAMBDA SENSOR, FRONT',
              partNumber: '65110261A',
              price: 2800000,
            ),
            SparePart(
              name: 'LAMBDA SENSOR, REAR',
              partNumber: '65110271A',
              price: 2800000,
            ),
            SparePart(
              name: 'SENSOR WASHER',
              partNumber: '85211071A',
              price: 35000,
            ),
            SparePart(
              name: 'EXHAUST VALVE ASSEMBLY',
              partNumber: '57410281A',
              price: 4500000,
            ),
            SparePart(
              name: 'VALVE MOTOR',
              partNumber: '57510291A',
              price: 3200000,
            ),
            SparePart(
              name: 'VALVE CABLE',
              partNumber: '57610301A',
              price: 850000,
            ),
            SparePart(
              name: 'CABLE HOLDER',
              partNumber: '74140381A',
              price: 120000,
            ),
            SparePart(
              name: 'EXHAUST FLANGE NUT M8',
              partNumber: '74840381A',
              price: 48000,
            ),
            SparePart(
              name: 'FLANGE STUD M8X30',
              partNumber: '77850331A',
              price: 75000,
            ),
            SparePart(
              name: 'MUFFLER DB KILLER',
              partNumber: '57710311A',
              price: 650000,
            ),
            SparePart(
              name: 'DB KILLER RIVET',
              partNumber: '77917261A',
              price: 35000,
            ),
            SparePart(
              name: 'EXHAUST HANGER RUBBER',
              partNumber: '70011181A',
              price: 180000,
            ),
            SparePart(
              name: 'HANGER BOLT',
              partNumber: '77850341A',
              price: 55000,
            ),
            SparePart(
              name: 'MUFFLER END CAP',
              partNumber: '57810321A',
              price: 950000,
            ),
            SparePart(
              name: 'END CAP SCREW',
              partNumber: '77157351A',
              price: 42000,
            ),
            SparePart(
              name: 'CARBON FIBER HEAT SHIELD',
              partNumber: '57910331A',
              price: 3500000,
            ),
            SparePart(
              name: 'EXHAUST COLLAR, FRONT',
              partNumber: '58010341A',
              price: 320000,
            ),
            SparePart(
              name: 'EXHAUST COLLAR, REAR',
              partNumber: '58010351A',
              price: 320000,
            ),
            SparePart(
              name: 'COLLECTOR PIPE',
              partNumber: '58110361A',
              price: 5500000,
            ),
            SparePart(
              name: 'COLLECTOR GASKET',
              partNumber: '79210331A',
              price: 220000,
            ),
            SparePart(
              name: 'EXHAUST SUPPORT BRACKET',
              partNumber: '58210371A',
              price: 1100000,
            ),
            SparePart(
              name: 'SUPPORT BOLT M10X40',
              partNumber: '77110491A',
              price: 95000,
            ),
            SparePart(
              name: 'EXHAUST SEAL RING',
              partNumber: '93010241A',
              price: 150000,
            ),
            SparePart(
              name: 'MUFFLER PACKING MATERIAL',
              partNumber: '58310381A',
              price: 450000,
            ),
            SparePart(
              name: 'EXHAUST TIP',
              partNumber: '58410391A',
              price: 1250000,
            ),
            SparePart(
              name: 'TIP RETAINING RING',
              partNumber: '85110111A',
              price: 85000,
            ),
            SparePart(
              name: 'EXHAUST VALVE COVER',
              partNumber: '58510401A',
              price: 680000,
            ),
            SparePart(
              name: 'COVER SCREW M6X12',
              partNumber: '77240413A',
              price: 38000,
            ),
            SparePart(
              name: 'VALVE POSITION SENSOR',
              partNumber: '65110281A',
              price: 1850000,
            ),
            SparePart(
              name: 'SENSOR SEAL',
              partNumber: '93010251A',
              price: 95000,
            ),
            SparePart(
              name: 'EXHAUST JOINT CLAMP',
              partNumber: '74140391A',
              price: 280000,
            ),
            SparePart(
              name: 'JOINT SPRING',
              partNumber: '79915141A',
              price: 110000,
            ),
            SparePart(
              name: 'MUFFLER PROTECTOR',
              partNumber: '58610411A',
              price: 2200000,
            ),
            SparePart(
              name: 'PROTECTOR MOUNT',
              partNumber: '58710421A',
              price: 550000,
            ),
            SparePart(
              name: 'MOUNT SCREW M8X20',
              partNumber: '77850351A',
              price: 48000,
            ),
            SparePart(
              name: 'EXHAUST SYSTEM COMPLETE KIT',
              partNumber: '58810431A',
              price: 35000000,
            ),
            SparePart(
              name: 'AKRAPOVIC SLIP-ON MUFFLER',
              partNumber: '58910441A',
              price: 28000000,
            ),
            SparePart(
              name: 'TERMIGNONI FULL SYSTEM',
              partNumber: '59010451A',
              price: 45000000,
            ),
          ],
        ),
        Catalog(
          name: 'OIL COOLER',
          image: 'assets/oil_cooler_supersport(23).png',
          parts: [
            SparePart(
              name: 'OIL COOLER ASSEMBLY',
              partNumber: '54010461A',
              price: 5500000,
            ),
            SparePart(
              name: 'OIL COOLER BRACKET',
              partNumber: '54110471A',
              price: 1200000,
            ),
            SparePart(
              name: 'BRACKET BOLT M8X25',
              partNumber: '77850361A',
              price: 52000,
            ),
            SparePart(
              name: 'OIL HOSE, INLET',
              partNumber: '54210481A',
              price: 950000,
            ),
            SparePart(
              name: 'OIL HOSE, OUTLET',
              partNumber: '54210491A',
              price: 950000,
            ),
            SparePart(
              name: 'HOSE CLAMP',
              partNumber: '74140401A',
              price: 85000,
            ),
            SparePart(
              name: 'OIL COOLER GASKET',
              partNumber: '79210341A',
              price: 150000,
            ),
            SparePart(
              name: 'COOLER MOUNTING RUBBER',
              partNumber: '70011191A',
              price: 180000,
            ),
            SparePart(
              name: 'OIL THERMOSTAT',
              partNumber: '54310501A',
              price: 2200000,
            ),
            SparePart(
              name: 'THERMOSTAT SEAL',
              partNumber: '93010261A',
              price: 120000,
            ),
            SparePart(
              name: 'OIL PRESSURE SENSOR',
              partNumber: '65110291A',
              price: 1650000,
            ),
            SparePart(
              name: 'SENSOR WASHER',
              partNumber: '85211081A',
              price: 42000,
            ),
            SparePart(
              name: 'OIL TEMPERATURE SENSOR',
              partNumber: '65110301A',
              price: 1750000,
            ),
            SparePart(
              name: 'COOLER GUARD',
              partNumber: '54410511A',
              price: 850000,
            ),
            SparePart(
              name: 'GUARD BRACKET',
              partNumber: '54510521A',
              price: 450000,
            ),
            SparePart(
              name: 'GUARD SCREW M6X15',
              partNumber: '77240423A',
              price: 45000,
            ),
            SparePart(
              name: 'OIL FILTER',
              partNumber: '54610531A',
              price: 280000,
            ),
            SparePart(
              name: 'FILTER COVER',
              partNumber: '54710541A',
              price: 650000,
            ),
            SparePart(
              name: 'COVER O-RING',
              partNumber: '93010271A',
              price: 95000,
            ),
            SparePart(
              name: 'OIL DRAIN PLUG',
              partNumber: '54810551A',
              price: 180000,
            ),
            SparePart(
              name: 'DRAIN PLUG WASHER',
              partNumber: '85211091A',
              price: 28000,
            ),
            SparePart(
              name: 'OIL FILLER CAP',
              partNumber: '54910561A',
              price: 450000,
            ),
            SparePart(
              name: 'FILLER CAP SEAL',
              partNumber: '93010281A',
              price: 85000,
            ),
          ],
        ),
        Catalog(
          name: 'THROTTLE BODY',
          image: 'assets/throttle_body_supersport(30).png',
          parts: [
            SparePart(
              name: 'THROTTLE BODY, FRONT CYLINDER',
              partNumber: '40010571A',
              price: 6500000,
            ),
            SparePart(
              name: 'THROTTLE BODY, REAR CYLINDER',
              partNumber: '40010581A',
              price: 6500000,
            ),
            SparePart(
              name: 'THROTTLE POSITION SENSOR, FRONT',
              partNumber: '65110311A',
              price: 1950000,
            ),
            SparePart(
              name: 'THROTTLE POSITION SENSOR, REAR',
              partNumber: '65110321A',
              price: 1950000,
            ),
            SparePart(
              name: 'INJECTOR, FRONT CYLINDER',
              partNumber: '40110591A',
              price: 3200000,
            ),
            SparePart(
              name: 'INJECTOR, REAR CYLINDER',
              partNumber: '40110601A',
              price: 3200000,
            ),
            SparePart(
              name: 'INJECTOR SEAL',
              partNumber: '93010291A',
              price: 120000,
            ),
            SparePart(
              name: 'THROTTLE BODY GASKET, FRONT',
              partNumber: '79210351A',
              price: 180000,
            ),
            SparePart(
              name: 'THROTTLE BODY GASKET, REAR',
              partNumber: '79210361A',
              price: 180000,
            ),
            SparePart(
              name: 'AIR TEMPERATURE SENSOR',
              partNumber: '65110331A',
              price: 1450000,
            ),
            SparePart(
              name: 'SENSOR SEAL',
              partNumber: '93010301A',
              price: 95000,
            ),
            SparePart(
              name: 'THROTTLE CABLE',
              partNumber: '40210611A',
              price: 850000,
            ),
            SparePart(
              name: 'CABLE ADJUSTER',
              partNumber: '40310621A',
              price: 280000,
            ),
            SparePart(
              name: 'THROTTLE BUTTERFLY VALVE, FRONT',
              partNumber: '40410631A',
              price: 1850000,
            ),
            SparePart(
              name: 'THROTTLE BUTTERFLY VALVE, REAR',
              partNumber: '40410641A',
              price: 1850000,
            ),
            SparePart(
              name: 'BUTTERFLY SCREW',
              partNumber: '77157361A',
              price: 55000,
            ),
            SparePart(
              name: 'THROTTLE SHAFT',
              partNumber: '40510651A',
              price: 1200000,
            ),
            SparePart(
              name: 'SHAFT BEARING',
              partNumber: '70241421A',
              price: 450000,
            ),
            SparePart(
              name: 'THROTTLE RETURN SPRING',
              partNumber: '79915151A',
              price: 150000,
            ),
            SparePart(
              name: 'IDLE SPEED ACTUATOR',
              partNumber: '40610661A',
              price: 2200000,
            ),
            SparePart(
              name: 'ACTUATOR GASKET',
              partNumber: '79210371A',
              price: 120000,
            ),
            SparePart(
              name: 'THROTTLE BODY CLAMP',
              partNumber: '74140411A',
              price: 95000,
            ),
            SparePart(
              name: 'CLAMP SCREW M6X20',
              partNumber: '77240433A',
              price: 42000,
            ),
            SparePart(
              name: 'AIR FUNNEL, FRONT',
              partNumber: '40710671A',
              price: 650000,
            ),
            SparePart(
              name: 'AIR FUNNEL, REAR',
              partNumber: '40710681A',
              price: 650000,
            ),
            SparePart(
              name: 'FUEL PRESSURE REGULATOR',
              partNumber: '40810691A',
              price: 2800000,
            ),
            SparePart(
              name: 'REGULATOR SEAL',
              partNumber: '93010311A',
              price: 110000,
            ),
            SparePart(
              name: 'FUEL RAIL',
              partNumber: '40910701A',
              price: 3500000,
            ),
            SparePart(
              name: 'RAIL MOUNTING BRACKET',
              partNumber: '41010711A',
              price: 450000,
            ),
            SparePart(
              name: 'BRACKET BOLT M8X20',
              partNumber: '77850371A',
              price: 48000,
            ),
          ],
        ),
        Catalog(
          name: 'HANDLEBAR CONTROLS',
          image: 'assets/handlebar_controls_supersport(33).png',
          parts: [
            SparePart(
              name: 'LEFT HANDLEBAR SWITCH',
              partNumber: '65210721A',
              price: 2500000,
            ),
            SparePart(
              name: 'RIGHT HANDLEBAR SWITCH',
              partNumber: '65210731A',
              price: 2500000,
            ),
            SparePart(
              name: 'SWITCH HOUSING, LEFT',
              partNumber: '65310741A',
              price: 850000,
            ),
            SparePart(
              name: 'SWITCH HOUSING, RIGHT',
              partNumber: '65310751A',
              price: 850000,
            ),
            SparePart(
              name: 'HOUSING SCREW M5X12',
              partNumber: '77240443A',
              price: 38000,
            ),
            SparePart(
              name: 'CLUTCH LEVER',
              partNumber: '65410761A',
              price: 950000,
            ),
            SparePart(
              name: 'FRONT BRAKE LEVER',
              partNumber: '65410771A',
              price: 950000,
            ),
            SparePart(
              name: 'LEVER PIVOT PIN',
              partNumber: '82114801A',
              price: 180000,
            ),
            SparePart(
              name: 'LEVER ADJUSTER SCREW',
              partNumber: '77157371A',
              price: 120000,
            ),
            SparePart(
              name: 'ADJUSTER LOCK NUT',
              partNumber: '74840391A',
              price: 55000,
            ),
            SparePart(
              name: 'LEVER RETURN SPRING',
              partNumber: '79915161A',
              price: 95000,
            ),
            SparePart(
              name: 'START BUTTON',
              partNumber: '65510781A',
              price: 650000,
            ),
            SparePart(
              name: 'KILL SWITCH',
              partNumber: '65510791A',
              price: 580000,
            ),
            SparePart(
              name: 'HORN BUTTON',
              partNumber: '65510801A',
              price: 420000,
            ),
            SparePart(
              name: 'TURN SIGNAL SWITCH',
              partNumber: '65510811A',
              price: 750000,
            ),
            SparePart(
              name: 'HIGH BEAM SWITCH',
              partNumber: '65510821A',
              price: 650000,
            ),
            SparePart(
              name: 'HAZARD SWITCH',
              partNumber: '65510831A',
              price: 720000,
            ),
            SparePart(
              name: 'MODE BUTTON',
              partNumber: '65510841A',
              price: 850000,
            ),
            SparePart(
              name: 'UP SHIFT BUTTON',
              partNumber: '65510851A',
              price: 680000,
            ),
            SparePart(
              name: 'DOWN SHIFT BUTTON',
              partNumber: '65510861A',
              price: 680000,
            ),
            SparePart(
              name: 'CRUISE CONTROL BUTTON',
              partNumber: '65510871A',
              price: 950000,
            ),
            SparePart(
              name: 'MIRROR ADJUSTER SWITCH',
              partNumber: '65510881A',
              price: 780000,
            ),
            SparePart(
              name: 'THROTTLE GRIP',
              partNumber: '65610891A',
              price: 1200000,
            ),
            SparePart(
              name: 'GRIP HOUSING',
              partNumber: '65710901A',
              price: 550000,
            ),
            SparePart(
              name: 'THROTTLE CABLE PULLEY',
              partNumber: '65810911A',
              price: 650000,
            ),
            SparePart(
              name: 'CABLE HOLDER',
              partNumber: '74140421A',
              price: 180000,
            ),
            SparePart(
              name: 'HANDLEBAR WEIGHT, LEFT',
              partNumber: '65910921A',
              price: 750000,
            ),
            SparePart(
              name: 'HANDLEBAR WEIGHT, RIGHT',
              partNumber: '65910931A',
              price: 750000,
            ),
            SparePart(
              name: 'WEIGHT SCREW M8X25',
              partNumber: '77850381A',
              price: 55000,
            ),
            SparePart(
              name: 'LEFT GRIP',
              partNumber: '66010941A',
              price: 420000,
            ),
            SparePart(name: 'GRIP GLUE', partNumber: '88010951A', price: 85000),
            SparePart(
              name: 'WIRING HARNESS, LEFT',
              partNumber: '66110961A',
              price: 1850000,
            ),
            SparePart(
              name: 'WIRING HARNESS, RIGHT',
              partNumber: '66110971A',
              price: 1850000,
            ),
          ],
        ),
      ];
    } else {
      _catalogs = [];
    }
    _selectedCatalogIndex = 0;
  }

  void nextCatalog() {
    if (_selectedCatalogIndex < _catalogs.length - 1) {
      _selectedCatalogIndex++;
      notifyListeners();
    }
  }

  void previousCatalog() {
    if (_selectedCatalogIndex > 0) {
      _selectedCatalogIndex--;
      notifyListeners();
    }
  }

  void incrementPartQuantity(int catalogIndex, int partIndex) {
    _catalogs[catalogIndex].parts[partIndex].quantity++;
    notifyListeners();
  }

  void decrementPartQuantity(int catalogIndex, int partIndex) {
    if (_catalogs[catalogIndex].parts[partIndex].quantity > 0) {
      _catalogs[catalogIndex].parts[partIndex].quantity--;
      notifyListeners();
    }
  }

  double get totalPrice {
    double total = 0;
    if (_catalogs.isNotEmpty && _catalogs.length > _selectedCatalogIndex) {
      for (var part in _catalogs[_selectedCatalogIndex].parts) {
        total += part.price * part.quantity;
      }
    }
    return total;
  }
}
