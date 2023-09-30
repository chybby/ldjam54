GDPC                                                                                         `   res://.godot/exported/133200997/export-0d1dd4bde6dfcbd071162e0f72fee110-held_item_manager.scn         �      �qE����ಙM<�    X   res://.godot/exported/133200997/export-41b46aed69b95f565564966477e88bdd-plant_pot.scn          7      �կ���(7�pe��    P   res://.godot/exported/133200997/export-435f623093a3e2498450e744191b98a6-main.scn        �      ������l��0�v�{    X   res://.godot/exported/133200997/export-6f17499e7cf090442cad7b38c73f3382-sprig_plant.scn �      �      ��W����<԰	�=��    X   res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res �2      �	      ׭���U��A%��5    \   res://.godot/exported/133200997/export-9fb5b1495b5eed426df6d741cfb7731c-main_menu_screen.scnP      f      g��˗{���f#����    X   res://.godot/exported/133200997/export-a1e7badfa168951d47978867b5239de5-terrarium.scn    '      �      �h -��	��5Q%�    T   res://.godot/exported/133200997/export-bec2adab23c7445f8c691a8f9552ccac-ui_theme.res�
      B      ��
*b�~��W�}v��    ,   res://.godot/global_script_class_cache.cfg  �Q             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�<      \      6(4�d=EQ�ǮVj,    L   res://.godot/imported/spritesheet.png-59f7dfdebfc035c80a63445e3bd8a9bd.ctex �J      d      G���\ .t���D�       res://.godot/uid_cache.bin  �a      p      h���w�jM� ��4��       res://default_env.tres.remapQ      h       cXv�S��P�O�Tq�o       res://icon.svg  �Q      N      ]��s�9^w/�����       res://icon.svg.import   �I      �       ���A�����&��[       res://main/main.tscn.remap   N      a       O�|&�t��[C �tV    ,   res://menus/main_menu/main_menu_screen.gd   �      �       ����#��^�kUz֐�>    4   res://menus/main_menu/main_menu_screen.tscn.remap   pN      m       T-���ςV��.��zav        res://menus/ui_theme.tres.remap �N      e       nq�h��	��	�,��b       res://project.binary`c      R      M�G��Q�¤�}�d    <   res://scenes/manager/held_item_manager/held_item_manager.gd       �      N  ����s.�##&P    D   res://scenes/manager/held_item_manager/held_item_manager.tscn.remap PO      n       �T����۠���*,A    $   res://scenes/plant/sprig_plant.gd   �             �B .�+8���    ,   res://scenes/plant/sprig_plant.tscn.remap   �O      h       �����o���r���    $   res://scenes/plant_pot/plant_pot.gd �      ^      e��1��ѹ>4ꢳ@H    ,   res://scenes/plant_pot/plant_pot.tscn.remap 0P      f       �ރ3�ܕ�~4Ժ@]    $   res://scenes/terrarium/terrarium.gd @      �      ���.l����«���    ,   res://scenes/terrarium/terrarium.tscn.remap �P      f       3�j�?G��h+gY��       res://spritesheet.png.import0M      �       ��ਞֻ:x3�gzu�    �Z�U�ʆ͑RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene &   res://scenes/terrarium/terrarium.tscn o�� ?�J   PackedScene &   res://scenes/plant_pot/plant_pot.tscn �M7��1   PackedScene $   res://scenes/plant/sprig_plant.tscn xm�P��1m   PackedScene >   res://scenes/manager/held_item_manager/held_item_manager.tscn I�:UG�:      local://PackedScene_imqxr �         PackedScene          	         names "   	      Main    Node 
   Terrarium 	   position 	   PlantPot    plant_scene 
   PlantPot2 
   PlantPot3    HeldItemManager    	   variants                 
     HB  �A         
     �A  �A         
     �A  �B
     C  B               node_count             nodes     8   ��������       ����                ���                            ���                                 ���                                 ���                                 ���                    conn_count              conns               node_paths              editable_instances              version             RSRC[`��8extends CanvasLayer

@onready var label := %Label

func on_button_pressed() -> void:
    label.text = "You pressed the button!"
RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script *   res://menus/main_menu/main_menu_screen.gd ��������      local://PackedScene_3bw3x !         PackedScene          	         names "         MainMenuScreen    script    CanvasLayer    PanelContainer    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    VBoxContainer    custom_minimum_size    layout_mode    size_flags_horizontal    size_flags_vertical    Button    text    Label    unique_name_in_owner    horizontal_alignment    vertical_alignment    on_button_pressed    pressed    	   variants    
                        �?      
     �C             
   Press Me!             Hello, World!             node_count             nodes     E   ��������       ����                            ����                                            	   	   ����   
                                         ����                                ����                        	      	             conn_count             conns                                      node_paths              editable_instances              version             RSRC82��Г�U�RSRC                    Theme            ��������                                                  resource_local_to_scene    resource_name    default_base_scale    default_font    default_font_size    Panel/styles/panel    script           local://Theme_jv58w          Theme                    RSRCHd��^.̝;k\extends Node

var held_item: Node2D


func _input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        if held_item != null:
            held_item.global_position = event.position


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
�?RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script <   res://scenes/manager/held_item_manager/held_item_manager.gd ��������      local://PackedScene_wfcbl 3         PackedScene          	         names "         HeldItemManager    script    held_item_manager    Node    	   variants                       node_count             nodes     
   ��������       ����                      conn_count              conns               node_paths              editable_instances              version             RSRCOϮ��嘒extends Node2D


;�g��3%3�����RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    atlas    region    margin    filter_clip    script 	   _bundled       Script "   res://scenes/plant/sprig_plant.gd ��������
   Texture2D    res://spritesheet.png .a|�C       local://AtlasTexture_520x6 �         local://PackedScene_00eqw �         AtlasTexture                            �A  �A  �A         PackedScene          	         names "         SprigPlant    script    Node2D    Sprite    texture 	   Sprite2D    	   variants                                 node_count             nodes        ��������       ����                            ����                   conn_count              conns               node_paths              editable_instances              version             RSRC�~W�����{��extends Node2D

@export var plant_scene: PackedScene

@onready var area_2d: Area2D = %Area2D
@onready var plant_position: Marker2D = %PlantPosition

var mouse_over := false
var plant: Node2D


func _ready() -> void:
    area_2d.mouse_entered.connect(on_mouse_entered.bind(true))
    area_2d.mouse_exited.connect(on_mouse_entered.bind(false))

    plant = plant_scene.instantiate()
    add_child(plant)
    plant.position = plant_position.position


func handle_click() -> void:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

    if held_item_manager.held_item == null and plant != null:
        held_item_manager.hold_item(plant)
        plant = null
    elif held_item_manager.held_item != null and plant == null:
        plant = held_item_manager.release_item()
        add_child(plant)
        plant.position = plant_position.position


func _input(event: InputEvent) -> void:
    if mouse_over && event.is_action_pressed("click"):
        handle_click()


func on_mouse_entered(entered: bool) -> void:
    mouse_over = entered
��RSRC                    PackedScene            ��������                                            
      resource_local_to_scene    resource_name    atlas    region    margin    filter_clip    script    custom_solver_bias    size 	   _bundled       Script $   res://scenes/plant_pot/plant_pot.gd ��������
   Texture2D    res://spritesheet.png .a|�C       local://AtlasTexture_y620r �         local://RectangleShape2D_oxv1f 2         local://PackedScene_ex40a c         AtlasTexture                        @B  �A  �A  �A         RectangleShape2D       
     �A  �A         PackedScene    	      	         names "      	   PlantPot    script    Node2D    PlantPosition    unique_name_in_owner 	   position 	   Marker2D 
   PotSprite    texture 	   Sprite2D    Area2D    CollisionShape2D    shape    	   variants                       
         ��
         �@                         node_count             nodes     1   ��������       ����                            ����                           	      ����                           
   
   ����                          ����                   conn_count              conns               node_paths              editable_instances              version             RSRC�����=�0extends Node2D

const SOIL_LAYER = 0
const OBSTACLE_LAYER = 1

@export var size := Vector2i(4, 3)

@onready var tile_map: TileMap = %TileMap

# Nested Array of Node2D.
var plants: Array


func _ready() -> void:
    plants = []
    for x in size.x:
        var column = []
        for y in size.y:
            column.append(null)
        plants.append(column)

    print(plants)


func get_clicked_cell_coords(position: Vector2):
    var coords = tile_map.local_to_map(tile_map.to_local(position))
    if tile_map.get_cell_tile_data(SOIL_LAYER, coords) == null:
        return null
    return coords


func get_plant_at_coords(coords: Vector2i):
    if plants == null:
        return null

    return plants[coords.x][coords.y]


func get_soil_at_coords(coords: Vector2i):
    var tile_data = tile_map.get_cell_tile_data(SOIL_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("soil_id")


func get_obstacle_at_coords(coords: Vector2i):
    var tile_data = tile_map.get_cell_tile_data(OBSTACLE_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("obstacle_id")


func handle_click(coords: Vector2i) -> void:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

    print("Soil at click is %s" % get_soil_at_coords(coords))
    print("Obstacle at click is %s" % get_obstacle_at_coords(coords))
    print("Plant at click is %s" % get_plant_at_coords(coords))

    if held_item_manager.held_item == null && get_plant_at_coords(coords) != null:
        var plant = plants[coords.x][coords.y] as Node2D
        held_item_manager.hold_item(plant)
        plants[coords.x][coords.y] = null
    elif held_item_manager.held_item != null && get_plant_at_coords(coords) == null && get_obstacle_at_coords(coords) == null:
        var plant = held_item_manager.release_item()
        plants[coords.x][coords.y] = plant
        add_child(plant)
        plant.position = tile_map.map_to_local(coords)


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("click"):
        var coords = get_clicked_cell_coords(event.position)
        if coords != null:
            handle_click(coords)
���*77�m�RSRC                    PackedScene            ��������                                            0      resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0    0:0/0/custom_data_1    0:0/0/script    1:0/0    1:0/0/custom_data_0    1:0/0/custom_data_1    1:0/0/script    2:0/0    2:0/0/custom_data_0    2:0/0/custom_data_1    2:0/0/script    0:1/0    0:1/0/custom_data_0    0:1/0/custom_data_1    0:1/0/script    1:1/0    1:1/0/custom_data_0    1:1/0/custom_data_1    1:1/0/script    2:1/0    2:1/0/custom_data_0    2:1/0/custom_data_1    2:1/0/script    3:0/0    3:0/0/custom_data_0    3:0/0/script    script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping    custom_data_layer_0/name    custom_data_layer_0/type    custom_data_layer_1/name    custom_data_layer_1/type 
   sources/0    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level 	   _bundled       Script $   res://scenes/terrarium/terrarium.gd ��������
   Texture2D    res://spritesheet.png .a|�C    !   local://TileSetAtlasSource_d1ap5          local://TileSet_03bf7 P         local://PackedScene_yrx2j �         TileSetAtlasSource                                ����	      
                         ����                               ����                      ����      ����                      ����      ����                      ����      ����                      ����       !         TileSet    '         soil_id (         )         obstacle_id *         +             !         PackedScene    /      	         names "      
   Terrarium    script    Node2D    TileMap    unique_name_in_owner    texture_filter 	   tile_set    format    layer_0/name    layer_0/tile_data    layer_1/name    layer_1/enabled    layer_1/modulate    layer_1/y_sort_enabled    layer_1/y_sort_origin    layer_1/z_index    layer_1/tile_data    layer_2/name    layer_2/enabled    layer_2/modulate    layer_2/y_sort_enabled    layer_2/y_sort_origin    layer_2/z_index    layer_2/tile_data    	   variants                                                  Soil     $                                                                                                                         
   Obstacles      �?  �?  �?  �?                                              Plants               node_count             nodes     8   ��������       ����                            ����                                 	      
                     	      
      
                              	      
      
                   conn_count              conns               node_paths              editable_instances              version       !      RSRC֑RSRC                    Environment            ��������                                            d      resource_local_to_scene    resource_name    sky_material    process_mode    radiance_size    script    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction        
   local://1 Q	         local://Environment_4euuu e	         Sky             Environment                                RSRC�� �dR���B7 �GST2   �   �      ����               � �        $  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�5��I��'���F�"ɹ{�p����	"+d������M�q��� .^>и��6��a�q��gD�h:L��A�\D�
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
�*V#��	NP��\�(�4^sh8T�H��P�_��}�Z�͒[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bgjejrq2i1iwr"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 kG���/���� a�1�GST2            ����                        ,  RIFF$  WEBPVP8L  /��?��������LԠ�B���X�Ql[m.����=>�D��X���m+��-������5
��- b����?�)��`Y�5���� ͹n/�� �^�$@�6�ja�H���?�$�Y�Q���.~�N콿����p�ޥ���;�>ι�s���z�Dԉ�/Ĺ�D����7\W\U���[b�1p=�B�1������]_�{�D����9�.�7]�cJ���1��j���a�1*e}O���Ɲ�D��+.���s"��������_����G��~cj�pIJ��e��W
"���Ҙ�E�}��23_~)_��  ��}��6^k�Y)/b�!�Tk�� �Z���,�Rv�Y�"�G� ,���s~�P_Dde�n�9g}D|�quԴS
�RJI)�4�x�u%s��2X�v� 0�%���(��H���ZS�1�� �Zh�U������3J�ӄ��Zg�Vg��1�3��!�F��f��������������������������w $��X�c�Ű:�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://8eecr57sb6kt"
path="res://.godot/imported/spritesheet.png-59f7dfdebfc035c80a63445e3bd8a9bd.ctex"
metadata={
"vram_texture": false
}
 �Ms!�G�c[remap]

path="res://.godot/exported/133200997/export-435f623093a3e2498450e744191b98a6-main.scn"
e=�	�2y�_�$q[remap]

path="res://.godot/exported/133200997/export-9fb5b1495b5eed426df6d741cfb7731c-main_menu_screen.scn"
�Ha[remap]

path="res://.godot/exported/133200997/export-bec2adab23c7445f8c691a8f9552ccac-ui_theme.res"
R<`Ϳ�{�[remap]

path="res://.godot/exported/133200997/export-0d1dd4bde6dfcbd071162e0f72fee110-held_item_manager.scn"
�[remap]

path="res://.godot/exported/133200997/export-6f17499e7cf090442cad7b38c73f3382-sprig_plant.scn"
i1� ���[remap]

path="res://.godot/exported/133200997/export-41b46aed69b95f565564966477e88bdd-plant_pot.scn"
ұ�H���[remap]

path="res://.godot/exported/133200997/export-a1e7badfa168951d47978867b5239de5-terrarium.scn"
��{��u¬t�[remap]

path="res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res"
�OfIdG�list=Array[Dictionary]([])
�c�E<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
��   @�M��R`3   res://main/main.tscn�֠�.o+   res://menus/main_menu/main_menu_screen.tscnI�:UG�:=   res://scenes/manager/held_item_manager/held_item_manager.tscnxm�P��1m#   res://scenes/plant/sprig_plant.tscn�M7��1%   res://scenes/plant_pot/plant_pot.tscno�� ?�J%   res://scenes/terrarium/terrarium.tscnMj�gv]9'   res://icon.svg.a|�C    res://spritesheet.pngECFG      application/config/name         Ldjam 54   application/config/tags   "         ldjam      application/run/main_scene         res://main/main.tscn   application/config/features$   "         4.1    Forward Plus       application/config/icon         res://icon.svg  "   display/window/size/viewport_width      �   #   display/window/size/viewport_height      Z   )   display/window/size/window_width_override      �  *   display/window/size/window_height_override      8     display/window/stretch/mode         viewport+   gui/common/drop_mouse_on_gui_input_disabled            input/click�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask          position     TC       global_position      XC  ,B   factor       �?   button_index         canceled          pressed          double_click          script      )   physics/common/enable_pause_aware_picking         9   rendering/textures/canvas_textures/default_texture_filter          )   rendering/environment/default_environment(          res://resources/default_env.tresɪ��aH'o7B�\�