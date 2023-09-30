GDPC                �                                                                      +   `   res://.godot/exported/133200997/export-0d1dd4bde6dfcbd071162e0f72fee110-held_item_manager.scn   0$      �      J�q��E�EJ��N�x    `   res://.godot/exported/133200997/export-281e4806e67dc3689dd167fc71dbfb72-terrarium_tile_map.scn  �m             ]������C����    X   res://.godot/exported/133200997/export-41b46aed69b95f565564966477e88bdd-plant_pot.scn   `Y      *      ����JF������    P   res://.godot/exported/133200997/export-435f623093a3e2498450e744191b98a6-main.scnp      �      *o��;w��9��V��    T   res://.godot/exported/133200997/export-446b1ed11cc7129b20b35ff4df2b3752-level_1.scn       �      ��N�����oHG�4
�    X   res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res �r      �	      ��^��V��Wm�k4^;    X   res://.godot/exported/133200997/export-8f2dd6db9a2f625cb490371ca356b165-sprig_plant.scn pF      �      ���%q��Q��;��Jy    \   res://.godot/exported/133200997/export-9fb5b1495b5eed426df6d741cfb7731c-main_menu_screen.scn�      f      �:2z4�������    T   res://.godot/exported/133200997/export-a18c5401c17cd33ddcb0f5ac6af637f4-level_2.scn        �      �6J��d�Ԛd���    X   res://.godot/exported/133200997/export-ba4166a23bc3e94c3db40d5bf012489d-grass_plant.scn 7      �      :M������\��3�    T   res://.godot/exported/133200997/export-bec2adab23c7445f8c691a8f9552ccac-ui_theme.res@      B      ���γ\?uX��:L    X   res://.godot/exported/133200997/export-c2589753ba0639f8de23e55ade79c0b4-fern_plant.scn  �(      �      7ߋ�o�7������|�-    T   res://.godot/exported/133200997/export-da1a8af3b15c9b11d63f26679dede64d-tile_set.res�      	      q�i�ۡ���zTwT�)    ,   res://.godot/global_script_class_cache.cfg  0�      6      �����u���Ni(hf�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex@|      \      6(4�d=EQ�ǮVj,    L   res://.godot/imported/spritesheet.png-59f7dfdebfc035c80a63445e3bd8a9bd.ctex p�      :      ֜r�D��;k�0ԅ�       res://.godot/uid_cache.bin  ��      �      ��m�f�Q�v�a?       res://default_env.tres.remap��      h       cXv�S��P�O�Tq�o       res://icon.svg  p�      N      ]��s�9^w/�����       res://icon.svg.import   ��      �       ���A�����&��[       res://main/main.gd          o      #�	�Iy'�7�o�K"       res://main/main.tscn.remap  ��      a       O�|&�t��[C �tV    ,   res://menus/main_menu/main_menu_screen.gd   P      �       ����#��^�kUz֐�>    4   res://menus/main_menu/main_menu_screen.tscn.remap   ��      m       T-���ςV��.��zav        res://menus/ui_theme.tres.remap `�      e       nq�h��	��	�,��b       res://project.binaryP�      R      �K��mn1����0�N    $   res://resources/tile_set.tres.remap Ў      e       ��ó�U��������       res://scenes/levels/level.gd�      j      	�Op�%&�2��Q�    (   res://scenes/levels/level_1.tscn.remap  @�      d       ?�:�,&6���!��?    (   res://scenes/levels/level_2.tscn.remap  ��      d       4�Fdj@4m\�����    <   res://scenes/manager/held_item_manager/held_item_manager.gd �!      8      ۴�ڤz�
�n����    D   res://scenes/manager/held_item_manager/held_item_manager.tscn.remap  �      n       �T����۠���*,A    ,   res://scenes/plant/fern_plant/fern_plant.gd �&      �      |�����ʫ��E    4   res://scenes/plant/fern_plant/fern_plant.tscn.remap ��      g       � Yc�tɘ�G�B    0   res://scenes/plant/grass_plant/grass_plant.gd   `6      �       ����{�Ij�,M5+�:    8   res://scenes/plant/grass_plant/grass_plant.tscn.remap    �      h       �#[�T1�h�(�t=��    0   res://scenes/plant/sprig_plant/sprig_plant.gd   �D      �      �C�f	0�8���-<    8   res://scenes/plant/sprig_plant/sprig_plant.tscn.remap   p�      h       �2���C�'�U˭2    $   res://scenes/plant_pot/plant_pot.gd 0T      -      1M\Ѝy�j��)�    ,   res://scenes/plant_pot/plant_pot.tscn.remap ��      f       �ރ3�ܕ�~4Ժ@]    8   res://scenes/terrarium_tile_map/terrarium_tile_map.gd   �^      �       �w7��i!j�W|a�
u    @   res://scenes/terrarium_tile_map/terrarium_tile_map.tscn.remap   P�      o       �~��
�]G��[�H�       res://spritesheet.png.import��      �       ��ਞֻ:x3�gzu�    v8Hm |��o��extends Node2D

@export var first_level_scene: PackedScene

@onready var level: Node2D = %Level


func _ready() -> void:
    load_level(first_level_scene)


func load_level(level_scene: PackedScene):
    for child in level.get_children():
        child.queue_free()
    var level_instance = level_scene.instantiate()
    level.add_child(level_instance)
    level_instance.load_next_level.connect(on_load_next_level)
    level_instance.end_game.connect(on_end_game)


func on_end_game() -> void:
    # TODO
    print("Game finished!")


func on_load_next_level(level_scene: PackedScene) -> void:
    load_level(level_scene)
�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://main/main.gd ��������   PackedScene !   res://scenes/levels/level_1.tscn ��7x�)E|   PackedScene >   res://scenes/manager/held_item_manager/held_item_manager.tscn I�:UG�:      local://PackedScene_l11mh �         PackedScene          	         names "         Main    script    first_level_scene    Node2D    Level    unique_name_in_owner    HeldItemManager    scale    	   variants                                         
      @   @      node_count             nodes        ��������       ����                                  ����                     ���                         conn_count              conns               node_paths              editable_instances              version             RSRC��m�~���)extends CanvasLayer

@onready var label := %Label

func on_button_pressed() -> void:
    label.text = "You pressed the button!"
RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script *   res://menus/main_menu/main_menu_screen.gd ��������      local://PackedScene_is6w8 !         PackedScene          	         names "         MainMenuScreen    script    CanvasLayer    PanelContainer    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    VBoxContainer    custom_minimum_size    layout_mode    size_flags_horizontal    size_flags_vertical    Button    text    Label    unique_name_in_owner    horizontal_alignment    vertical_alignment    on_button_pressed    pressed    	   variants    
                        �?      
     �C             
   Press Me!             Hello, World!             node_count             nodes     E   ��������       ����                            ����                                            	   	   ����   
                                         ����                                ����                        	      	             conn_count             conns                                      node_paths              editable_instances              version             RSRC/�Զ�gRSRC                    Theme            ��������                                                  resource_local_to_scene    resource_name    default_base_scale    default_font    default_font_size    Panel/styles/panel    script           local://Theme_lafnn          Theme                    RSRCZ�y���pr�|��=RSRC                    TileSet            ��������                                            #      resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0    0:0/0/custom_data_1    0:0/0/script    1:0/0    1:0/0/custom_data_0    1:0/0/custom_data_1    1:0/0/script    2:0/0    2:0/0/custom_data_0    2:0/0/custom_data_1    2:0/0/script    3:0/0    3:0/0/custom_data_0    3:0/0/script    script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping    custom_data_layer_0/name    custom_data_layer_0/type    custom_data_layer_1/name    custom_data_layer_1/type 
   sources/0    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level    
   Texture2D    res://spritesheet.png .a|�C    !   local://TileSetAtlasSource_d1ap5 �         local://TileSet_pcikq �         TileSetAtlasSource                    -            -                         ����	      
                         ����                               ����                      ����               TileSet             soil_id                   obstacle_id                             RSRC]��~]�extends Node2D

signal load_next_level(level_scene: PackedScene)
signal end_game

@export var tile_map: TerrariumTileMap
@export var plant_pots: Array[PlantPot]
@export var next_level_scene: PackedScene


func _ready() -> void:
    tile_map.state_changed.connect(on_tile_map_state_changed)


func is_level_complete() -> bool:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return false

    if not held_item_manager.is_empty():
        return false

    for plant_pot in plant_pots:
        if not plant_pot.is_empty():
            return false

    return tile_map.are_all_plants_satisfied()


func on_tile_map_state_changed() -> void:
    if is_level_complete():
        if next_level_scene != null:
            load_next_level.emit(next_level_scene)
        else:
            end_game.emit()
��xw�	RSRC                    PackedScene            ��������                                                  TerrariumTileMap 	   PlantPot 
   PlantPot2    resource_local_to_scene    resource_name 	   _bundled    script       Script    res://scenes/levels/level.gd ��������   PackedScene !   res://scenes/levels/level_2.tscn ��0gU�(   PackedScene 8   res://scenes/terrarium_tile_map/terrarium_tile_map.tscn �If�W�   PackedScene &   res://scenes/plant_pot/plant_pot.tscn �M7��1   PackedScene 0   res://scenes/plant/grass_plant/grass_plant.tscn ��?v�-7      local://PackedScene_y2erl c         PackedScene          	         names "         Level1    scale    script 	   tile_map    plant_pots    next_level_scene    Node2D    TerrariumTileMap    layer_0/tile_data    layer_1/tile_data 	   PlantPot 	   position    initial_plant_scene 
   PlantPot2    	   variants       
      @   @                                                                                                                          
     �A  NB         
     
C  LB      node_count             nodes     2   ��������       ����                  @     @                     ���               	                  ���
            	      
               ���                  
             conn_count              conns               node_paths              editable_instances              version             RSRC��E���y4RSRC                    PackedScene            ��������                                                  TerrariumTileMap 	   PlantPot 
   PlantPot2 
   PlantPot3    resource_local_to_scene    resource_name 	   _bundled    script       Script    res://scenes/levels/level.gd ��������   PackedScene 8   res://scenes/terrarium_tile_map/terrarium_tile_map.tscn �If�W�   PackedScene &   res://scenes/plant_pot/plant_pot.tscn �M7��1   PackedScene .   res://scenes/plant/fern_plant/fern_plant.tscn �Ϊ̘K8W   PackedScene 0   res://scenes/plant/sprig_plant/sprig_plant.tscn �O�}5z	W      local://PackedScene_ww3uw ~         PackedScene          	         names "         Level2    scale    script 	   tile_map    plant_pots    Node2D    TerrariumTileMap    layer_1/tile_data 	   PlantPot 	   position    initial_plant_scene 
   PlantPot2 
   PlantPot3    	   variants       
      @   @                                                                                       
     �A  �A         
     �A  �B         
     C  B      node_count             nodes     9   ��������       ����                  @     @               ���                           ���         	      
                  ���         	   	   
   
               ���         	      
   
             conn_count              conns               node_paths              editable_instances              version             RSRCb�)extends Node2D

var held_item: Node2D


func _input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        if held_item != null:
            held_item.global_position = event.position


func is_empty() -> bool:
    return held_item == null


func hold_item(item: Node2D) -> void:
    held_item = item
    item.get_parent().remove_child(item)
    add_child(item)
    item.global_position = get_viewport().get_mouse_position()


func release_item() -> Node2D:
    remove_child(held_item)
    var item = held_item
    held_item = null
    return item
6�D�^�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script <   res://scenes/manager/held_item_manager/held_item_manager.gd ��������      local://PackedScene_2lpnx 3         PackedScene          	         names "         HeldItemManager    script    held_item_manager    Node2D    	   variants                       node_count             nodes     
   ��������       ����                      conn_count              conns               node_paths              editable_instances              version             RSRCI��~�Lextends Node2D

var is_satisfied := false


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # For now, fern plant is satisfied if next to a rock.
    for coord in tile_map.get_surrounding_coords(plant_position):
        if tile_map.get_obstacle(coord) == tile_map.OBSTACLE_ROCK:
            is_satisfied = true
            return true

    is_satisfied = false
    return false
���c!���D��7RSRC                    PackedScene            ��������                                            &      Sprite    skew    scale    x    y    resource_local_to_scene    resource_name    length 
   loop_mode    step    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    tracks/1/type    tracks/1/imported    tracks/1/enabled    tracks/1/path    tracks/1/interp    tracks/1/loop_wrap    tracks/1/keys    tracks/2/type    tracks/2/imported    tracks/2/enabled    tracks/2/path    tracks/2/interp    tracks/2/loop_wrap    tracks/2/keys    script    _data    atlas    region    margin    filter_clip 	   _bundled       Script ,   res://scenes/plant/fern_plant/fern_plant.gd ��������
   Texture2D    res://spritesheet.png .a|�C       local://Animation_qutxt          local://Animation_vvoej �         local://AnimationLibrary_rt26r �
         local://AtlasTexture_520x6 �
         local://PackedScene_ua3ke ;      
   Animation          o�:
         bezier                                                                    times !                points !            ��      �>          handle_modes                     bezier                                                                       times !                points !        �?  ��      �>          handle_modes                     bezier                                                                       times !                points !        �?  ��      �>          handle_modes                  
   Animation             sway          @         
         bezier                                                                    times !          ��L>  �?���?   @      points !                  ���=    �)�����    ���=    �>����    ���=    �)�����    ���=        ����                  handle_modes                                    bezier                                                                       times !          ���>fff?33�?   @      points !        �?        ���=    �k?����    ��=    \��?���    ���=      �?����    ��=      �?���                  handle_modes                                    bezier                                                                       times !          ���>fff?33�?   @      points !        �?        ���=    ��?����    ��=    ��?���    ���=    H�Z?����    ��=      �?���                  handle_modes                                    AnimationLibrary                    RESET                 sway                   AtlasTexture    !            "        �B  �?  �A  �A         PackedScene    %      	         names "      
   FernPlant    script    Node2D    AnimationPlayer 	   autoplay 
   libraries    Sprite 	   position    texture    offset 	   Sprite2D    	   variants                       sway                       
         �@         
         ��      node_count             nodes     !   ��������       ����                            ����                           
      ����               	                conn_count              conns               node_paths              editable_instances              version             RSRCu�!�extends Node2D

var is_satisfied := true


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Grass is satisfied always.
    return true
RSRC                    PackedScene            ��������                                            &      Sprite    skew    scale    x    y    resource_local_to_scene    resource_name    length 
   loop_mode    step    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    tracks/1/type    tracks/1/imported    tracks/1/enabled    tracks/1/path    tracks/1/interp    tracks/1/loop_wrap    tracks/1/keys    tracks/2/type    tracks/2/imported    tracks/2/enabled    tracks/2/path    tracks/2/interp    tracks/2/loop_wrap    tracks/2/keys    script    _data    atlas    region    margin    filter_clip 	   _bundled       Script .   res://scenes/plant/grass_plant/grass_plant.gd ��������
   Texture2D    res://spritesheet.png .a|�C       local://Animation_qutxt          local://Animation_vvoej �         local://AnimationLibrary_rt26r �
         local://AtlasTexture_520x6 �
         local://PackedScene_t50qm =      
   Animation          o�:
         bezier                                                                    times !                points !            ��      �>          handle_modes                     bezier                                                                       times !                points !        �?  ��      �>          handle_modes                     bezier                                                                       times !                points !        �?  ��      �>          handle_modes                  
   Animation             sway          @         
         bezier                                                                    times !          ��L>  �?���?   @      points !                  ���=    �)�����    ���=    �>����    ���=    �)�����    ���=        ����                  handle_modes                                    bezier                                                                       times !          ���>fff?33�?   @      points !        �?        ���=    �k?����    ��=    \��?���    ���=      �?����    ��=      �?���                  handle_modes                                    bezier                                                                       times !          ���>fff?33�?   @      points !        �?        ���=    ��?����    ��=    ��?���    ���=    H�Z?����    ��=      �?���                  handle_modes                                    AnimationLibrary                    RESET                 sway                   AtlasTexture    !            "        	C  �?  �A  �A         PackedScene    %      	         names "         GrassPlant    script    Node2D    AnimationPlayer 	   autoplay 
   libraries    Sprite 	   position    texture    offset 	   Sprite2D    	   variants                       sway                       
         �@         
         ��      node_count             nodes     !   ��������       ����                            ����                           
      ����               	                conn_count              conns               node_paths              editable_instances              version             RSRC��extends Node2D

var is_satisfied := false


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # For example, sprig is satisfied if it's at the edge of the terrarium.
    for coord in tile_map.get_surrounding_coords(plant_position):
        if tile_map.get_soil(coord) == null:
            is_satisfied = true
            return true

    is_satisfied = false
    return false
�)RSRC                    PackedScene            ��������                                            &      Sprite    skew    scale    x    y    resource_local_to_scene    resource_name    length 
   loop_mode    step    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    tracks/1/type    tracks/1/imported    tracks/1/enabled    tracks/1/path    tracks/1/interp    tracks/1/loop_wrap    tracks/1/keys    tracks/2/type    tracks/2/imported    tracks/2/enabled    tracks/2/path    tracks/2/interp    tracks/2/loop_wrap    tracks/2/keys    script    _data    atlas    region    margin    filter_clip 	   _bundled       Script .   res://scenes/plant/sprig_plant/sprig_plant.gd ��������
   Texture2D    res://spritesheet.png .a|�C       local://Animation_qutxt          local://Animation_vvoej �         local://AnimationLibrary_rt26r �
         local://AtlasTexture_520x6 �
         local://PackedScene_3vxqs =      
   Animation          o�:
         bezier                                                                    times !                points !            ��      �>          handle_modes                     bezier                                                                       times !                points !        �?  ��      �>          handle_modes                     bezier                                                                       times !                points !        �?  ��      �>          handle_modes                  
   Animation             sway          @         
         bezier                                                                    times !          ��L>  �?���?   @      points !                  ���=    �)�����    ���=    �>����    ���=    �)�����    ���=        ����                  handle_modes                                    bezier                                                                       times !          ���>fff?33�?   @      points !        �?        ���=    �k?����    ��=    \��?���    ���=      �?����    ��=      �?���                  handle_modes                                    bezier                                                                       times !          ���>fff?33�?   @      points !        �?        ���=    ��?����    ��=    ��?���    ���=    H�Z?����    ��=      �?���                  handle_modes                                    AnimationLibrary                    RESET                 sway                   AtlasTexture    !            "        �B  �?  �A  �A         PackedScene    %      	         names "         SprigPlant    script    Node2D    AnimationPlayer 	   autoplay 
   libraries    Sprite 	   position    texture    offset 	   Sprite2D    	   variants                       sway                       
         �@         
         ��      node_count             nodes     !   ��������       ����                            ����                           
      ����               	                conn_count              conns               node_paths              editable_instances              version             RSRC'�@tool
extends Node2D
class_name PlantPot

@export var initial_plant_scene: PackedScene

@onready var area_2d: Area2D = %Area2D
@onready var plant_position: Node2D = %PlantPosition

var mouse_over := false
var plant: Node2D


func _ready() -> void:
    area_2d.mouse_entered.connect(on_mouse_entered.bind(true))
    area_2d.mouse_exited.connect(on_mouse_entered.bind(false))

    if initial_plant_scene != null:
        plant = initial_plant_scene.instantiate()
        add_plant(plant)


func is_empty() -> bool:
    return plant == null


func add_plant(new_plant: Node2D) -> void:
    plant_position.add_child(new_plant)
    new_plant.position = Vector2.ZERO


func handle_click() -> void:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

    # TODO: swap held and clicked plants?
    if held_item_manager.held_item == null and plant != null:
        held_item_manager.hold_item(plant)
        plant = null
    elif held_item_manager.held_item != null and plant == null:
        plant = held_item_manager.release_item()
        add_plant(plant)


func _input(event: InputEvent) -> void:
    if mouse_over && event.is_action_pressed("click"):
        handle_click()


func on_mouse_entered(entered: bool) -> void:
    mouse_over = entered
 .RSRC                    PackedScene            ��������                                            
      resource_local_to_scene    resource_name    atlas    region    margin    filter_clip    script    custom_solver_bias    size 	   _bundled       Script $   res://scenes/plant_pot/plant_pot.gd ��������
   Texture2D    res://spritesheet.png .a|�C       local://AtlasTexture_y620r �         local://RectangleShape2D_oxv1f 2         local://PackedScene_j2wnv c         AtlasTexture                        �B  �?  �A  �A         RectangleShape2D       
     �A  �A         PackedScene    	      	         names "      	   PlantPot    script    Node2D    PlantPosition    unique_name_in_owner 	   position 
   PotSprite    texture 	   Sprite2D    Area2D    CollisionShape2D    shape    	   variants                       
         ��
         �@                         node_count             nodes     1   ��������       ����                            ����                                 ����                           	   	   ����                    
   
   ����                   conn_count              conns               node_paths              editable_instances              version             RSRCL��; extends TileMap
class_name TerrariumTileMap

signal state_changed

const SOIL_LAYER = 0
const SOIL_SAND = 0
const SOIL_NORMAL = 1
const SOIL_WET = 2

const OBSTACLE_LAYER = 1
const OBSTACLE_ROCK = 0

# Nested Array of Node2D.
var plants: Array


func _ready() -> void:
    # This is the size of every used tile of the tilemap.
    # Not every tile is necessarily soil.
    var size = calculate_size()
    print("Calculated size: %s" % size)

    plants = []
    for x in size.x:
        var column = []
        for y in size.y:
            column.append(null)
        plants.append(column)


func calculate_size() -> Vector2i:
    return get_used_rect().end


func get_clicked_cell_coords(click_position: Vector2):
    var coords = local_to_map(to_local(click_position))
    if get_cell_tile_data(SOIL_LAYER, coords) == null:
        return null
    return coords


func get_plant(coords: Vector2i):
    if plants == null:
        return null

    return plants[coords.x][coords.y]


func get_soil(coords: Vector2i):
    var tile_data = get_cell_tile_data(SOIL_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("soil_id")


func get_obstacle(coords: Vector2i):
    var tile_data = get_cell_tile_data(OBSTACLE_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("obstacle_id")


# Need to make sure update_plants has been called before this.
func are_all_plants_satisfied() -> bool:
    for column in plants:
        for plant in column:
            if plant != null:
                if not plant.is_satisfied:
                    return false

    return true


func update_plants() -> void:
    for x in plants.size():
        for y in plants[x].size():
            var plant = plants[x][y]
            if plant == null:
                continue
            var coords = Vector2i(x, y)
            plant.check_satisfied(coords, self)
            print("%s at %s satisfied? %s" % [plant, coords, plant.is_satisfied])


func get_surrounding_coords(coord: Vector2i, include_center: bool = false) -> Array[Vector2i]:
    var coords = [] as Array[Vector2i]
    for x in [-1, 0, 1]:
        for y in [-1, 0, 1]:
            if not include_center and x == 0 and y == 0:
                continue
            var delta = Vector2i(x, y)
            coords.append(coord + delta)

    return coords


func place_plant(plant: Node2D, coords: Vector2i) -> void:
    plants[coords.x][coords.y] = plant
    add_child(plant)
    plant.global_position = to_global(map_to_local(coords))
    update_plants()


func uproot_plant(coords: Vector2i) -> Node2D:
    var plant = plants[coords.x][coords.y] as Node2D
    plants[coords.x][coords.y] = null
    update_plants()
    return plant


func handle_click(coords: Vector2i) -> void:
    print("click")
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

    print("Soil at %s is %s" % [coords, get_soil(coords)])
    print("Obstacle at %s is %s" % [coords, get_obstacle(coords)])
    print("Plant at %s is %s" % [coords, get_plant(coords)])

    # TODO: swap held and clicked plants?
    if held_item_manager.held_item == null && get_plant(coords) != null:
        held_item_manager.hold_item(uproot_plant(coords))
        # This needs to happen after the held_item_manager is updated.
        state_changed.emit()
    elif held_item_manager.held_item != null && get_plant(coords) == null && get_obstacle(coords) == null:
        place_plant(held_item_manager.release_item(), coords)
        state_changed.emit()


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("click"):
        var coords = get_clicked_cell_coords(event.position)
        if coords != null:
            handle_click(coords)
�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       TileSet    res://resources/tile_set.tres c�s�8�y   Script 6   res://scenes/terrarium_tile_map/terrarium_tile_map.gd ��������      local://PackedScene_myf0o c         PackedScene          	         names "         TileMap 	   tile_set    format    layer_0/name    layer_0/tile_data    layer_1/name    layer_1/enabled    layer_1/modulate    layer_1/y_sort_enabled    layer_1/y_sort_origin    layer_1/z_index    layer_1/tile_data    script    	   variants                             Soil     $                                                                                                                      
   Obstacles            �?  �?  �?  �?                                                      node_count             nodes        ��������        ����                                                    	      
         	      
             conn_count              conns               node_paths              editable_instances              version             RSRC�K��I�&G�I>RSRC                    Environment            ��������                                            d      resource_local_to_scene    resource_name    sky_material    process_mode    radiance_size    script    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction        
   local://1 Q	         local://Environment_6q3pq e	         Sky             Environment                                RSRC+��x��il�*T�GST2   �   �      ����               � �        $  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�5��I��'���F�"ɹ{�p����	"+d������M�q��� .^>и��6��a�q��gD�h:L��A�\D�
�\=k�(���_d2W��dV#w�o�	����I]�q5�*$8Ѡ$G9��lH]��c�LX���ZӞ3֌����r�2�2ؽL��d��l��1�.��u�5�!�]2�E��`+�H&�T�D�ި7P��&I�<�ng5�O!��͙������n�
ؚѠ:��W��J�+�����6��ɒ�HD�S�z�����8�&�kF�j7N�;YK�$R�����]�VٶHm���)�rh+���ɮ�d�Q��
����]	SU�9�B��fQm]��~Z�x.�/��2q���R���,snV{�7c,���p�I�kSg�[cNP=��b���74pf��)w<:Ŋ��7j0���{4�R_��K܅1�����<߁����Vs)�j�c8���L�Um% �*m/�*+ �<����S��ɩ��a��?��F�w��"�`���BrV�����4�1�*��F^���IKJg`��MK������!iVem�9�IN3;#cL��n/�i����q+������trʈkJI-����R��H�O�ܕ����2
���1&���v�ֳ+Q4蝁U
���m�c�����v% J!��+��v%�M�Z��ꚺ���0N��Q2�9e�qä�U��ZL��䜁�u_(���I؛j+0Ɩ�Z��}�s*�]���Kܙ����SG��+�3p�Ei�,n&���>lgC���!qյ�(_e����2ic3iڦ�U��j�q�RsUi����)w��Rt�=c,if:2ɛ�1�6I�����^^UVx*e��1�8%��DzR1�R'u]Q�	�rs��]���"���lW���a7]o�����~P���W��lZ�+��>�j^c�+a��4���jDNὗ�-��8'n�?e��hҴ�iA�QH)J�R�D�̰oX?ؿ�i�#�?����g�к�@�e�=C{���&��ށ�+ڕ��|h\��'Ч_G�F��U^u2T��ӁQ%�e|���p ���������k	V����eq3���8 � �K�w|�Ɗ����oz-V���s ����"�H%* �	z��xl�4��u�"�Hk�L��P���i��������0�H!�g�Ɲ&��|bn�������]4�"}�"���9;K���s��"c. 8�6�&��N3R"p�pI}��*G��3@�`��ok}��9?"@<�����sv� ���Ԣ��Q@,�A��P8��2��B��r��X��3�= n$�^ ������<ܽ�r"�1 �^��i��a �(��~dp-V�rB�eB8��]
�p ZA$\3U�~B�O ��;��-|��
{�V��6���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���H�#2:E(*�H���{��>��&!��$| �~�\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j���	P:�a�G0 �J��$�M���@�Q��[z��i��~q�1?�E�p�������7i���<*�,b�е���Z����N-
��>/.�g�'R�e��K�)"}��K�U�ƹ�>��#�rw߶ȑqF�l�Ο�ͧ�e�3�[䴻o�L~���EN�N�U9�������w��G����B���t��~�����qk-ί�#��Ξ����κ���Z��u����;{�ȴ<������N�~���hA+�r ���/����~o�9>3.3�s������}^^�_�����8���S@s%��]K�\�)��B�w�Uc۽��X�ǧ�;M<*)�ȝ&����~$#%�q����������Q�4ytz�S]�Y9���ޡ$-5���.���S_��?�O/���]�7�;��L��Zb�����8���Guo�[''�،E%���;����#Ɲ&f��_1�߃fw�!E�BX���v��+�p�DjG��j�4�G�Wr����� 3�7��� ������(����"=�NY!<l��	mr�՚���Jk�mpga�;��\)6�*k�'b�;	�V^ݨ�mN�f�S���ն�a���ϡq�[f|#U����^����jO/���9͑Z��������.ɫ�/���������I�D��R�8�5��+��H4�N����J��l�'�כ�������H����%"��Z�� ����`"��̃��L���>ij~Z,qWXo�}{�y�i�G���sz�Q�?�����������lZdF?�]FXm�-r�m����Ф:�З���:}|x���>e������{�0���v��Gş�������u{�^��}hR���f�"����2�:=��)�X\[���Ů=�Qg��Y&�q�6-,P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸~��f��i���_�j�S-|��w�R�<Lծd�ٞ,9�8��I�Ү�6 *3�ey�[�Ԗ�k��R���<������
g�R���~��a��
��ʾiI9u����*ۏ�ü�<mԤ���T��Amf�B���ĝq��iS��4��yqm-w�j��̝qc�3�j�˝mqm]P��4���8i�d�u�΄ݿ���X���KG.�?l�<�����!��Z�V�\8��ʡ�@����mK�l���p0/$R�����X�	Z��B�]=Vq �R�bk�U�r�[�� ���d�9-�:g I<2�Oy�k���������H�8����Z�<t��A�i��#�ӧ0"�m�:X�1X���GҖ@n�I�겦�CM��@������G"f���A$�t�oyJ{θxOi�-7�F�n"�eS����=ɞ���A��Aq�V��e����↨�����U3�c�*�*44C��V�:4�ĳ%�xr2V�_)^�a]\dZEZ�C 
�*V#��	NP��\�(�4^sh8T�H��P�_��}�D��e[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bgjejrq2i1iwr"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 �k5��
�Db9�rGST2   �         ����               �           RIFF�  WEBPVP8L�  /�@��&���ZB�[���GH>�D�ipC�

Ť�@­vV�m�:�$��
^�<�Ч�"�G���?o��`LT �8�hK���v��^ ��!H�Y������l��� b�"�??�4�q=��3�l�=��1x���o�N����9�����(�!�?��t"����m۾۶}�S-R��wfv�E��9D�5"jD3ǒ2��
����5 ��DԚvh�S��n�Ϊ&j ?T���p*��,M|3��A���͘(^���\J���7�-y  �\b7@����P��73��;�r�])�� ���Z#�݌����}3��Z.@�EM�lS�۩�Rr��e�"�T)�L! .���>����(ʩ��!FC�  �
x��5�R<P@�M�Ar�7ؽ�p(0��Z�Dz#����,f< ���uU	Pk��%��A�$�&��6)�5�4�#Yk��.�O����o���A�=���sY��  -�c��
[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://8eecr57sb6kt"
path="res://.godot/imported/spritesheet.png-59f7dfdebfc035c80a63445e3bd8a9bd.ctex"
metadata={
"vram_texture": false
}
 ��<bmv�[remap]

path="res://.godot/exported/133200997/export-435f623093a3e2498450e744191b98a6-main.scn"
�LoR&�u.�4/�?[remap]

path="res://.godot/exported/133200997/export-9fb5b1495b5eed426df6d741cfb7731c-main_menu_screen.scn"
@׋[remap]

path="res://.godot/exported/133200997/export-bec2adab23c7445f8c691a8f9552ccac-ui_theme.res"
G2��P)��'X[remap]

path="res://.godot/exported/133200997/export-da1a8af3b15c9b11d63f26679dede64d-tile_set.res"
K�&̀Y���4[remap]

path="res://.godot/exported/133200997/export-446b1ed11cc7129b20b35ff4df2b3752-level_1.scn"
��A �	��[remap]

path="res://.godot/exported/133200997/export-a18c5401c17cd33ddcb0f5ac6af637f4-level_2.scn"
|�����_<
�[remap]

path="res://.godot/exported/133200997/export-0d1dd4bde6dfcbd071162e0f72fee110-held_item_manager.scn"
��[remap]

path="res://.godot/exported/133200997/export-c2589753ba0639f8de23e55ade79c0b4-fern_plant.scn"
퓬�'9�[remap]

path="res://.godot/exported/133200997/export-ba4166a23bc3e94c3db40d5bf012489d-grass_plant.scn"
�EY�":��[remap]

path="res://.godot/exported/133200997/export-8f2dd6db9a2f625cb490371ca356b165-sprig_plant.scn"
2|�^�[remap]

path="res://.godot/exported/133200997/export-41b46aed69b95f565564966477e88bdd-plant_pot.scn"
,L��DP|8�[remap]

path="res://.godot/exported/133200997/export-281e4806e67dc3689dd167fc71dbfb72-terrarium_tile_map.scn"
�[remap]

path="res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res"
r����:�list=Array[Dictionary]([{
"base": &"Node2D",
"class": &"PlantPot",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/plant_pot/plant_pot.gd"
}, {
"base": &"TileMap",
"class": &"TerrariumTileMap",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/terrarium_tile_map/terrarium_tile_map.gd"
}])
F��� T<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
��   @�M��R`3   res://main/main.tscn�֠�.o+   res://menus/main_menu/main_menu_screen.tscnc�s�8�y   res://resources/tile_set.tres��7x�)E|    res://scenes/levels/level_1.tscn��0gU�(    res://scenes/levels/level_2.tscnI�:UG�:=   res://scenes/manager/held_item_manager/held_item_manager.tscn�Ϊ̘K8W-   res://scenes/plant/fern_plant/fern_plant.tscn��?v�-7/   res://scenes/plant/grass_plant/grass_plant.tscn�O�}5z	W/   res://scenes/plant/sprig_plant/sprig_plant.tscn�M7��1%   res://scenes/plant_pot/plant_pot.tscn�If�W�7   res://scenes/terrarium_tile_map/terrarium_tile_map.tscnMj�gv]9'   res://icon.svg.a|�C    res://spritesheet.png���V��2�{ykwECFG      application/config/name         Ldjam 54   application/config/tags   "         ldjam      application/run/main_scene         res://main/main.tscn   application/config/features$   "         4.1    Forward Plus       application/config/icon         res://icon.svg  "   display/window/size/viewport_width      @  #   display/window/size/viewport_height      �   )   display/window/size/window_width_override      �  *   display/window/size/window_height_override           display/window/stretch/mode         viewport+   gui/common/drop_mouse_on_gui_input_disabled            input/click�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask          position     TC       global_position      XC  ,B   factor       �?   button_index         canceled          pressed          double_click          script      )   physics/common/enable_pause_aware_picking         9   rendering/textures/canvas_textures/default_texture_filter          )   rendering/environment/default_environment(          res://resources/default_env.tres,����g$]L+�