PGDMP              	            z            db_jambi    14.3    14.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32768    db_jambi    DATABASE     h   CREATE DATABASE db_jambi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE db_jambi;
                postgres    false            �            1259    41242    dd1    TABLE     �  CREATE TABLE public.dd1 (
    no text NOT NULL,
    no_ruas text NOT NULL,
    jl text NOT NULL,
    nama_ruas text NOT NULL,
    kecamatan_yang_dilalui text NOT NULL,
    panjang_ruas text NOT NULL,
    lebar text NOT NULL,
    hotmix text NOT NULL,
    aspal text NOT NULL,
    perkerasan_beton text NOT NULL,
    kerikil text NOT NULL,
    tanah text NOT NULL,
    kon_baik_deg text NOT NULL,
    kon_baik_km text NOT NULL,
    kon_sedang_deg text NOT NULL,
    kon_sedang_km text NOT NULL,
    kon_r_ringan_deg text NOT NULL,
    kon_r_ringan_km text NOT NULL,
    kon_r_berat_deg text NOT NULL,
    kon_r_berat_km text NOT NULL,
    lhr text NOT NULL,
    akses text NOT NULL,
    keterangan text,
    kolom_kontrol text NOT NULL,
    id_gambar integer
);
    DROP TABLE public.dd1;
       public         heap    postgres    false            �            1259    49510    gambar    TABLE     �   CREATE TABLE public.gambar (
    id integer NOT NULL,
    gambar text,
    deskripsi text,
    no_dd1 text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.gambar;
       public         heap    postgres    false            �            1259    49509    gambar_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gambar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.gambar_id_seq;
       public          postgres    false    213                       0    0    gambar_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.gambar_id_seq OWNED BY public.gambar.id;
          public          postgres    false    212            �            1259    41234    ruas    TABLE     �  CREATE TABLE public.ruas (
    no text NOT NULL,
    no_ruas text NOT NULL,
    jl text NOT NULL,
    nama_ruas text NOT NULL,
    patok_km_dari text NOT NULL,
    patok_km_ke text NOT NULL,
    panjang_ruas text NOT NULL,
    baik text NOT NULL,
    sedang text NOT NULL,
    ruask_ringan text NOT NULL,
    rusak_berat text NOT NULL,
    mantap text NOT NULL,
    tidak_mantap text NOT NULL,
    jenis_penanganan text NOT NULL,
    abkt text
);
    DROP TABLE public.ruas;
       public         heap    postgres    false            �            1259    41250    survey    TABLE     �  CREATE TABLE public.survey (
    tanggal date NOT NULL,
    no_ruas text NOT NULL,
    nama_ruas text NOT NULL,
    dari_sta text NOT NULL,
    ke_sta text NOT NULL,
    status text NOT NULL,
    provinsi text NOT NULL,
    susunan text NOT NULL,
    kondisi text NOT NULL,
    penurunan text NOT NULL,
    tambalan text NOT NULL,
    jenis text NOT NULL,
    lebar text NOT NULL,
    luas text NOT NULL,
    jumlah_lubang text NOT NULL,
    ukuran_lubang text NOT NULL,
    bekas_roda text NOT NULL,
    kerusakan_tepi text NOT NULL,
    kondisi_bahu text NOT NULL,
    permukaan_bahu text NOT NULL,
    kondisi_saluran_samping text NOT NULL,
    kerusakan_lereng text NOT NULL,
    trotoar text NOT NULL
);
    DROP TABLE public.survey;
       public         heap    postgres    false            h           2604    49513 	   gambar id    DEFAULT     f   ALTER TABLE ONLY public.gambar ALTER COLUMN id SET DEFAULT nextval('public.gambar_id_seq'::regclass);
 8   ALTER TABLE public.gambar ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213                      0    41242    dd1 
   TABLE DATA           G  COPY public.dd1 (no, no_ruas, jl, nama_ruas, kecamatan_yang_dilalui, panjang_ruas, lebar, hotmix, aspal, perkerasan_beton, kerikil, tanah, kon_baik_deg, kon_baik_km, kon_sedang_deg, kon_sedang_km, kon_r_ringan_deg, kon_r_ringan_km, kon_r_berat_deg, kon_r_berat_km, lhr, akses, keterangan, kolom_kontrol, id_gambar) FROM stdin;
    public          postgres    false    210   :                  0    49510    gambar 
   TABLE DATA           K   COPY public.gambar (id, gambar, deskripsi, no_dd1, created_at) FROM stdin;
    public          postgres    false    213   O�                 0    41234    ruas 
   TABLE DATA           �   COPY public.ruas (no, no_ruas, jl, nama_ruas, patok_km_dari, patok_km_ke, panjang_ruas, baik, sedang, ruask_ringan, rusak_berat, mantap, tidak_mantap, jenis_penanganan, abkt) FROM stdin;
    public          postgres    false    209   ɡ                 0    41250    survey 
   TABLE DATA           (  COPY public.survey (tanggal, no_ruas, nama_ruas, dari_sta, ke_sta, status, provinsi, susunan, kondisi, penurunan, tambalan, jenis, lebar, luas, jumlah_lubang, ukuran_lubang, bekas_roda, kerusakan_tepi, kondisi_bahu, permukaan_bahu, kondisi_saluran_samping, kerusakan_lereng, trotoar) FROM stdin;
    public          postgres    false    211   =
                 0    0    gambar_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.gambar_id_seq', 23, true);
          public          postgres    false    212            m           2606    41248    dd1 dd1_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.dd1
    ADD CONSTRAINT dd1_pkey PRIMARY KEY (no);
 6   ALTER TABLE ONLY public.dd1 DROP CONSTRAINT dd1_pkey;
       public            postgres    false    210            t           2606    49517    gambar gambar_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.gambar
    ADD CONSTRAINT gambar_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.gambar DROP CONSTRAINT gambar_pkey;
       public            postgres    false    213            k           2606    41240    ruas ruas_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.ruas
    ADD CONSTRAINT ruas_pkey PRIMARY KEY (no);
 8   ALTER TABLE ONLY public.ruas DROP CONSTRAINT ruas_pkey;
       public            postgres    false    209            p           2606    41256    survey survey_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.survey
    ADD CONSTRAINT survey_pkey PRIMARY KEY (no_ruas);
 <   ALTER TABLE ONLY public.survey DROP CONSTRAINT survey_pkey;
       public            postgres    false    211            q           1259    49541    fki_fk_idDd1    INDEX     C   CREATE INDEX "fki_fk_idDd1" ON public.gambar USING btree (no_dd1);
 "   DROP INDEX public."fki_fk_idDd1";
       public            postgres    false    213            n           1259    49535    fki_fk_idGambar    INDEX     F   CREATE INDEX "fki_fk_idGambar" ON public.dd1 USING btree (id_gambar);
 %   DROP INDEX public."fki_fk_idGambar";
       public            postgres    false    210            r           1259    49553 
   fki_no_dd1    INDEX     ?   CREATE INDEX fki_no_dd1 ON public.gambar USING btree (no_dd1);
    DROP INDEX public.fki_no_dd1;
       public            postgres    false    213            u           2606    49548    gambar no_dd1    FK CONSTRAINT     �   ALTER TABLE ONLY public.gambar
    ADD CONSTRAINT no_dd1 FOREIGN KEY (no_dd1) REFERENCES public.dd1(no) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 7   ALTER TABLE ONLY public.gambar DROP CONSTRAINT no_dd1;
       public          postgres    false    210    3181    213                  x���[w7�.����6/�r�<��ےe�5��^�׼$�j�D��]���� ��@ )i��sZ�,nF!���E��P�EP/���Fu��Ë��7�~z�a�0�����a�7��K����3���=����z�T�z�xs�����������$]$n���Z�R��nFW��?7�7�?�od�FƋ+��������������"%�H�\�AW�o�O�������t�˒�<m/��ҕX��w�n:.Т�w��4���i�:K}�N �x~�W�\�삣�*ņM�G�܅��zY��j����±o��iz��P=��Q;��˳q`���6����P�w���ez��r�y:�w���S#To��ncB��*0���=����彻MP �<�8���G.:pѿ��G�\��\.\7��������9	)� .3q�Q�t��B��]�M���k���T�^�����ÿ��/��/�&ѕ��S��U*��eٳ�/��a7=炙����8/.�3�3��1��i�S�=a�-.(>JͲ?L����7�1bTt=o"����lT��A�<?��o�˱H���|8�x�bx}s��v����?��]�����n͛�Y �$U0��t�>w�E��p�������W���+��q��k~ �TL� ӫ���t7(����rt٠]Y!�k��áG9.�;n�֤p���c�*X��qz������D�A-�Ҙ����C��;��ؗ��I
�y�p��&~�LQ���
��ޟ�7��i��T~���%����)��f��@��F�E4U �����p�����������7�$�f ��d>�@�&x<���'$��'P7�S�����4��v���\���Wf\1
����:��br���AF�ߐ�&ke���,~�L�Y5G�H���SLz9�Z��n1�Ŭ�!T�&!�O��^MG�-��`m-]/h�a'L�l��u{�q͓丢ͷg���l"�	�ʻK�TA5Dkz���3رr�l�e¯��'��� 4Wp�>a~�ܕ�vL؏w٢���t�I���u��YZ<��yު�U�F��氣=���������$��+��#�F����x���,����%�9���d��m��C�m�bm;��U�p��� vlD�=:����q�|���%�iQ��gTW���h�dŽ�/���!�5o���2�t�/������ߣ�X·#o�r�_>=�&E�rE�E��`d����#L���H8����Vaw��f��HdT#�t�LP��U+�����p�8-$IQ��2�κJ읱�;��F� c��?��8�FO�m��;����j�p�15`�����^(e�ɖm�_�w��[MmH�g���,[�_[@0��cIS�$G�� �M�ݱw� d��Q�G
e�T8��!�yz�x��;dD�ow��ʾ�Cg�02�Uh�����2ţ^��6��;��珻��Sg��l~�aǃ�mL��e��]��cr�??l���axy>H;k�����"��4�Qg۳g9����/ޞ������K�C��v�w��Λ�pb�Y����e'�@�J�IrB�ou��xb	O���x�9K�G0�a�Ţb�"���VԊإ������"6n����D�.��&�rh�Z~��9�#�ѝA��g�}���m9��/�nO�3��χݗi���y~Zp-͋@՘m���q<�O�������&�����;i��8�XOr��v�Y����ݓ4���r!TOh��neq����-{����$����r��@����.��bWe���qP�����-&|�ي��1y}�+
��r��r7�f+��MB���˓����Eڀ'R��N�Z���cQV?[-cR��qgܸ"xŨ }g�㽦ت_ǡ����|��Dޯwk�<h]�?k<�϶���R:�:��λ����NMG�d�J�[�4s�D�H�E�?�<v�Te��7.���3$��!���Y4�].ʕ|��1c�YHTŹ��V9����_lF�М�J&�֟ȇԱ���ۗ��s�H1����RU<��2�+"+�c��$n��Ǭ�;d@#X�U�c�4��Y�\ Y���������f�Ŧ#(ɲm�yo�uG��Gϡ��y��n�9�<tQC�8���&g?�≛�u,�I���m��xB.5�!�ѩ�P�+WB����(:����$P���z���׮��h�!(���D~��ǴO���W$��|;��2����{T��5<O`��o�5�����n�rgl��?\�K��a����I�yUmD/����]��Q<!��p~��B"l(y)x�QZT
�BOW���O�8{�Ê'Xy��N(i��n����?�U�;V��#�'Dy:<g'������x�2p�|�.4�L���Q���c���;w[e���q\�p��M�}8���.�[�%4��.?/�����1�!�Y���W����yi
�&Z�\>����*Uléf�6p�	�2���|ߙ�]x�}��E��*I=���.�����v��#�c�)�D�#�Q�=1A��O���qץ�BB�+]ѼQ���
����<�������JP�G��"]�?<��e�������K^OC��IFs�	w���'Pr�@D�	���bEr
��f�jB������'H���P��V�S���EǙPp�zz������0���q�e)-j"�G��HaVBh�]�}7��=L5��~����Q h�
�\o�&�h--��d9e�	�b�Z��
�\���UA��n9ρeru��D��
���CC]_T�6�ֈFb���| ӥB�\hY\c�*���N��X ��*6B��ҿ�k�w
��09vĂ��7��p�=d�z��v��_�]������J��g5���u�X��뱺<���v��}����kJ<EW3]��OԆ"��h��w����iw������+�'c���F�'�1y�?N�a��)�)ûN-Xʾ���dgɇ�f_"ǖX���aw|��k3�<��Lc�Hj���"G�X���=��]ra��mh��ġ%��P�#������Յc��x�Z{,q��5���;O��⃱|��%�oY���[��`$q�I�쎄aB庙�x�ڢ|Ⓢ�%�;I�K�X�]�K�������^�h;t]��r\mԟ��*�&q�If]�L�sѿ�x[0&�D9�$�.O:�*��/���Ża~�Z#BP�&(�$G��օK�o���^J��f�́�hd~iԚ�܅��M�Xx�"O�8%��=���d��b���Ƅ�Ǭ�=���q��S
�S���B�(nNMt%U�i����p��$���UZ�I�6��t�J��$M6j����NIYb�α+=�]]c�U���8o��}���}Q�g����w!��˾�쬍mTǻ$.��R��fKfN�V�1P�O���-��z)	_ZYʆh%U;�SV9
*���gLu�R�b|fQ�1g{-�s6��A�F��Z�W=�
πZF�q4󜖨��( D��K|�T��(�	r ���1�d���%���x���v:��l(�Р�ͧ�2M�e}hͶ�ws����_u�%�F2)W���4�����+t�R�gV�2`��p���Uj&�\M��/��w�������󣤪�z�ޠOB��O΃Vĺ�?[���>OW�ߣ~��;z!H�Ce��w%�	��/���.;G��G$����)�wP �Z[��,ȡ���Q�wO��8���[��}	tW.��gHܷ��N������Y��R���&�O���~��N|iC�>��ƺ�%�/lh=H�o����Y��lELLuK�\fA��gJ{���]~?�E.���%�<�ov�$|$�x��h�d���)(~������`��|#]������!��@�l��M�_�D�s9�J8H\L"1�0_wk4h)�b�XF��e�k�Mq�Ȗ���QWZ���Y��������{'�����_9߄���CUY���4�1�o��I塚$�i�����ц
"�9���/E3����`S�@�2����=��4����<D�0��<    �d�}��t?���&N-�(yABk�o�昱ص���H\������UPe�$���C�W��;cڤ{�@(�[)�+��^����$fY�($�DtlG�I�M>BG�Y����?AHBѿ����5�I\�N!K�4���O��(�ec��+�B�oQu���U'\M���7���q����Eĝ��[g�%/z�%�������8��O�ZF2/�� CU
W��ܟx�'������$��D7e8�P����׶�0 a[G��$~g]	(��?�o�� ԖKC�T^9�C��كW�qP�w@~9h���r0�ڄ�-T���k�O�X�����:�Hխ8�,T�0��犸T�'�����'ń�a8��������7����W��b#@m�Z�o'(<�$��}r������m�?����������ōT%˒�I�Wi2���&�`���l��1��P�o�J/��v�7q�$�`&��L�h��V�U%\�w����Û�~��pR�pL�蛩b�N[��1�zt ���Bao䷬g'��,%�Z�E��0D%
Wً��Cw��^�@:��j~��o���ݭ�
)v�d��K�d�\^b ��JJ����qL�Z��`��(��%_��b�h�/��Qr ���W�����p5��mj�O�'���<����,b�TxMJ�lʫ��T�e�	��*"�T�/�CU+�|�?V�q��x�{	ID�f�D�@T� ��o�3=��������aya��d�.jG�v��H)��r��b��O���/Co\)�-CY�k�US�ԱF�H�:T������_����;�@�HQ�c�z许�q������O��ax���<����u���Z����q�J~�n�����.g*Aܳt1���=
5{��Zr���?�C�]
ͱ~�nŻ�&o �@�@�0�«��m�KJ���Ã��G*e��l�U����;��وn�q�z�WP�y�")Oe�0]�3%�R��=]� O*��~�5 �q$�,����&�D6BWDYX�W� �� D���O+��(\�6���Wk�O�7r]s���^�}1��|<�{�m:vX��x��fnE�>d�NpZ�Er������w�qe��qϦG�4���q�R��ǿ��/�p���\�h3�m���A6[�s�qM�����{���ԅ)z��U�:	u���1��ALn�߭�R�[G;H+�����d��s�qK��������Ǹ��bO@o���'�c�ksM��.	x$���?��x�P&Ƹ��|�J��F�v\�i:f�������΄\�%/I��)[W��!�Մ�g����V�uDJRy�c�3�s�Y�w�_��2���/w��G����O59�+�/�-V��HD���ү����x;vn{��;lU�����v|�d�@E..�O�+ �e≮D�7�RgzHn.�\�C�	!\�C_��+Q�������i���?+�d$���@v.ےo,p�b�7���?�8!^~s��YR8F���fN���s���a���� #w,$�����t�5r��&o�a��Ż�}{��V S�����M���vm6��++�hW�A�j ~�?N(J�4�WB��V| �RM=Si5�I���ʕ��A��C�/��
\�����^nf�MT���%K�[�g5xi.�'r速�>^AT�H[�c�55��f�5�^+���A`���j:@M~���2�５4B��[:lJ���Z�X9�Zpy{��+���Z<��7�B�!��KƿR��@T�D�	TN{�t3ݝ�7wO��Z�ˆ.VJ��bw�G�^K��P���=Fjt��1S���ܓiS����D�
o�l���SU���0�ҍhqS؇���9<Qq��O�a%�e+7!�f(�Ą�b
��X��V$� *R���&��}�G��������}����{+��U,�FI}4�a~4����|	AtI���ȼk��k��]�P�/�ܝVހ��&���j$�b�U���|�N��"ǢPk0Y����ޭ@}��jQ2s	��/i�\S@>7c��8*�Ԉ_K�iLRa$*6�Ɉ����O!0�K�ȁ)֚L`4�������F��mU�pk!&0~00]\�_��ӄ,���7DP1�v�yA$W�#R�_�\y&!�&Ze�u�Q����h��fs�}����gShG��r<
P���],���c۽��Q+��į�K�YRk�`�&FRfG-*�("�L��9:+t���]۱3�+�� >��vx�;�P��~A���}��I�Cnبk�V<,���������Hqm������@E��v�w�5;���[���Q]�<
.I�D$iMT�+�U!�-�T��
�,q4�2�R.�r��]���4�mU�#N�q]�=r����wyۜ����L,�+d�.�-x	z�D�U�i%���8R-~ş�N�DY��GCT��_�y,����Q�G�O��(L=r��2�w����x�=o���q���l\bv���g
�K���G3�b�V�z�HD��=N���B���6G��a��NV�둃�B��`�t����&����J�����s��(�kzX5�r�Դ�e�|�Q5���Ee�+�����a��䛓v����+�z�D�_��Am
Z������IM��Ep��{=6ؔ���WEW/�o�!;eH��#�'d�9�v^�f-]b,6�:��3I�_Ώ���+~��S�4w��Eemt�:ՅK�P��K�����Zܾ������ѥ�;�����9=��T��z1\憐�NY�l�xp:+������ZƐ4�G����/�?v��/�k�ʛ��@�mCSc{of�:�f��+`��i�b�@�\��oJ�āU�/V^LIt����Z:�,��2Aۀ���Z�B���>��^>��wF�5'H��	�W(����s���A��ȥQ��t���RO����<���7���G�T���bo�eYq��b#���¤e,EsZ�"Zt�v��������1?��bw���hN�VD��~��z�Nc���۳A��I���������5�):>�����Ҝ	��	}���i��Ąb�'M�~����?�n��gE�����v<i�YD�����,�g4'A+"A���i��b.c;�+)/w#b@WAf�����4��Gy¤� $�}��ִ�L�UKc�J(s�0��G��,�i#W�1E�����vݓ���L��sc���)�iЊhЋ�5iՑ긻r�X�?+�?S�	�:�P�ι�xp#�n�RӢ��g�=��m2���j΃Vă���Ǉ����C��K;�hʜdG:�	ъ����5p,��6�!�o��qB�"BtF�)��3" ݇m��i����AB/W�{^e�z_*��:9�!����x<�f���͊ua��)�_X�T���@�3D�� ���#�����|�	���<Ȩ�*�w���xhN�VԲ�<���ye������%�CѮ�����/60T�T�
��%�w-35�K+�K�����7SOJP�XB/���;���h�G#"Ig���f���ю���F�|9+��p��^P�Q�~Z�
Nל�����8����>L�9|��Z�� �u$�;?9f<zE�d�7c����O�)ъ(��[�*��o�W�䩥����O��+@�i�8B���ϯٲ��U��f;�a��%:��"B����;p�2��O����!
��b:�
�D�!�����5$������?OOk�<����T-F1~���q��a,M�Y�+@`�iE��[�o�f�p"�45��Q��	b��@�1Ě���	ԊԳص(O�L��B�'A;�i9c:��C)x�E��*ľ9$�L��iE����?�S�=��<�+�vt9�'_���Zwn����̙ӊ�������N���V���>�r9]Z]��e�>�B���iEi�^�f�q��~�=f���S�����e�>��#zaD����
��1#���yuR�����
m����Y�v����B{�,��R9f� �o���"71{    mJ��m�a���E�W��r�;$�ce��^��f�:x>Hm���J�U�S�$��è�R�0��Xɩ�#��e� ��/tg�ʇ�q�������b�.�Y�N�i�e�*)-b�U
9t��b<GԢ{�^(�f3��mOy}�[ܲUG���َ�[�B�6˘�E���!pu/F��Ƨ�C���Y&�u;UJ@��-�]������ �C�c
Ň~:<LkoG�|��@��}|P(@��3���� 8�)�ZsT���̉�Q�E��sX� Q�]�©�,�#*M�,�,*��T�B���|�(�H��Ba����;u���s5��ۇ�D��n�p4�(�����4��6��١���Zp=\g
y %�����5W��ǧᇡVZ
�{Ԋ�.<���Wȡ��F$9���^��aİ������!�i-�s,�`�{�����˄�Bˌ���}��2�M(^D����I�?W⸮���v�t��BA�W���HA��3��J	�k��I������y����t<�����u�����ci�b�'�=|�kڄ�Tx+�s�����!�i��F��f�l� <���e�tmw�s���ѯ��=4�|c�䑄�]�����P/��bk�m$"ٟ&(�3���M����>F8�P���?��!;۝�R4[��ʡ��sv�cy�����,�;��t�]���3r�:LWsќ킁V�TV����Lڡ;00���k�E�l�I�"p��uF�	��4)B"�y�FZ4���9�P��%��RP���M\��(���ȑ�"2o�0����X�˅،rl�����]�q:e|9ރ�r�M��eϧ�<>�4��
S_葺`r�I��r�1uͧ�ߡ[&t�������}WL9}�N�9F�㌩#h��7�` ��h�U�0��/ձ�~,�6�漕��ȡ��!4�?�lk���kPO�!톩%��tğ��4M��~�9Ԙy�m�Gr�z3��&Q�;17PG,�R��a��p�?Mǥ`���)P��<�k.�����<�^(�2��;�{Z)�����؋]�E�I�L֑c�`����p�{�A��Ĥ �����v�I�#4?n����/�cW+���{/�	��?��=�����D��ш�� �P�j���Z~�fbOy�2(�f:I�p�Ɖ��YR���L�%2T��E���p=�n��s��#]	<u���rO\�*ڷ�i�0�?�eZ^]g0��e��	"�q4�[�^��z�|����Pz.�x쳍y���xuU����dվ��[��r,=��:��JgM\�"�:{KO+��qFb:�}�h�� +��+T��:�����n勒����\���\�V��E�\i�*H��B����H3r �
tȗe��m�q����t�
�x�� �q qj���/S��"Ls�T
���S2��,uh�4� _�9�P��Jh|6#�O�a?k��w�4a����	���?\�a%�}�L���+]R���+"f�pB��_�����׽C'ߡ�c�G�$Tf���~)���ZG˃�ɔ�4n�Wc%W�:9�8�M�������4��8"�䟽-�Gp����ŉ��	^M��F���L��|�뿓���ȁ�ŵ7�KL�h��ε�����#�w�(h���� ?N0����lCeP2����:�<�x�nT���ca,�YKF�Y��v΅T�R(����kQ(~W�B?��l�tȏؕ�Nȁ7�IΥ~��z�uX�������0���y>�!V#VY[g�ɥ9��g�,�`�$AV�vb�gS�/:��_��"���0A��c�g֖8�6+�ךd�T�����N_���~��(�DWBH��"�lv�]2 �����0�K�[�}[�����Yث�_���G�K��h:�]2 ��o��|+E����U�YjC����=����1��" =[ޘ�K�R�I*��9�0����" �zz�j%*$B�*Q=�[^����(C���ï�/�۽|����;�r�@&u�
q$45����݇�0�V>V�@ǚ���j�I�NB��XC)�WSv����vʆ�@�Ԙwy,o3vU%QV�H��h7�/y��Y�{����ƗyQXe���4j�&9�P�����6y���i_Le�hm��뷭Eu(�$�R9�P���#v
�H~�*�,؊Zv�n�e��ߴ}(a�f:lO�qL����8i�!�^��C��s��|yJ)^ѪD����dj�$��ˇ�+.���n��/�P\������4�jm�^6�#NM�d�Lw�[�e'_uC!�~���$��7�y�;L�@�O���E�gEc8�,9�~\��|�l(`;��]^�P�'V�#�����B�q����������M�pP�i�eO7O�'���%����b�{�p4�9�����[��@ϖ�Yc7�{ӸC}���R�+`���{�����ݏ��k�0�eá�fX��{���oہ����h���\��h9����3m�9JRD���.B�p��,�oYq{�x��T�Q���*�K�f!�9\��N44��^~;��Nu��B��B�|�J���?�f�%ͻX�~`e4��P(�����}3O��;����R�b��˜|���;�]�Q��R33�l�I��\j�e{�i��R�5MG�@Cw��^�^j��Dz�CD�҆���/�H��
K�rx�����^hڃ�{>M��@�=��gT�4~�T�6�Dt���tj֥OIH���R���齱3�,�J���87`'��~׹����S��%Bb�Km�X?���ny(�/G��l3����Í�@D����a�AZ���z���:��_�Q�����s���C��묟���l�OS���iţ�F��"U+���hCI�^f���8M���U�U�l��ǎ#����7�um���N�,j���r���?��m4���vj_	����ő��/�x���yR"<�DN��X�F�����n�7G������]65�4!-���DP�N�y�Kp���؃���us��Y�ŏ�(ҧ�=�>��|�0$q�O�S#��"%����T�aP7҆V�Q4L3����C���O�O�C���/t-U���/�뎣|��t\��l��#uX�mj}��V�2	J8�]L���9hXŝ���O�mٍ��0^����)j+Hi�K_����b�+�\u��	u���rR�Y��n��0[HAe}�����Ю�"�;.�u�V�F�n�.5�R�g]X
��*5����x�?�����N��OS������ùM��q��i��jk���ޟ��-l�)���P��vN���g�aB���0�ؕ.<d�����x=I,��~�\�;�m����K�� ���`:���f�J�<���W�J��W��}d�R8��*��0���0����[h�92����y�B�����g:�6�V��/]8�~�N��-�o��/^N��;���X��u{�f&�A���B��fz��4��}������;�����0���s�|ȋF��������f!�um�.�R�`�vF����E업�%%SWS~�BZ���Rl� O�l�oTԫ�D2�4! ��/8V+���f�����VRQ� 4�KE������ş�^�j�	`{7�]����T��S�������n�(����dE��A���|������j��/֘Q�GiqJS$]�~QT�G|�����N��:؍�n՜)���*��B���B��E��;j�$NHV�����z�k9`"GRX(��x��7��^ �~,��#��Eۘ���"� RQ$s��r��R|W{G��Q���W�[s��NUO�!��-�=նZ�ղ6�8r�!}��M�P��2ia9��|��n�����H���'���;�[�DlX��&�	M��'�`�XBr�B{kr!	�Y��3�����35�ןw��7O�)C��{[ؔ^��L�	7uW	��L��+�Z����|P�8��f]�GE���(:~��+f����էm�8U��0�    �+���a�/JV:;]#W��(c�_8,l�����$O�X�EP�n���jY�?���A�P��pn)���X�s�t&[y��4��p�����wClEa��ЕX��s$٣�,��0�,0qn�Z!��h���v��J�o�S�^���jp�����>@�My�Ծ��0��̯hCgfpX������/w�KH��X�nX��ew�b��Y=]�M0-�}�����n��v��Pt�0���í�|;5�n�oE��rl�U��x���?��S+�P)�שKK&i��NG����~�e��9��
L����Й�Z��J�����Ұ��f��O����5G��OT�/ٗ����ͨq��u�~�v+/2|�{��iG�K3�L�Nx����ב�4�$��v�`Bt�?v�Զ�KBq�2�#;Av@��F�"XT9B����t%�FFc��B�T�����о, �EB,�$b1~�k8gG�!Ĭ�|����B+��]�⿚l��:F �9��e��ޞ;)�������jץ�We���(�v�B��_�@�� ��̞�
)�&��1�(�g<>��Y$�<k�~�}���i�D�9���kk[�Ep-�&���g;r,!bI˯��t+����v4C�8�h6'��A�b��b�m��E�1�8x��u�8�8�:ҕ��S~��=7��!����y�g�oR�Q��Y��C�:��ٗ�,�t��܊���AC�[%�C%04� c+���+֑�z�R�KY_��(��`�׃��T��`bj���){4bf��ҿ������a���������ԚA�4JR�Y���Ι�bfZ&��E���o+O�YR�X��,~�ܕE�Vq�{x}���EXX��Yb]�4�Υ��ts!^����|a�F8EWbYN&5�ml5�ڶk��J�P+g��������� �F]k� ����'4�<���ݪD�?�)5�".���-=�_!D����=�9~Y��`j䀡S��v��6�P���,=;,���_��g[�F��p	Q���	��o�4iX�)�Vsܨ����(�T���XE�;&� �ˋ��bYށ�i@���D�Ob5��-�YpNZp^p=��A|�bZ]>~�>����O��,��Gi%�YVs��ub��3�ZI�@���c�:�!z�(��I k��Y��0\��|+��-��l�8�(�j�f8bԪP|�WO{���ʳ��-�B��ѝ� 4�K�ű6B,�w������F|��9�c�:�(E�Fk8�P�(�`�'篓��N�.�q�+4p"�d-�5O�f4�r��el�-b��H>Yć
��/}�8�'���h�k�����N��ݯ� �"0��ɗ��؃�,�P ��or|q��s+e������O���Q�_�5[��b�*ޝG����C�T���Jc=~�����=�@�����rAnM����C���v��k���|�'�C�%h�
��X+�W�jչ��l8�^ӥo�HAЬy�H�(p]	]�h7G�rle���M�7�T�J�������l���7m���߁]!Pr/����ܵ�\X|�q.����D"���K�~t�i[ETFZ-��q`& <3\�+��Ue�����(|��hX\p_}����+�M7�Z��OP�+��" vr-%�^������a+��te���F5���_.��̻������n3�&iAv�&,��s���ɤO�VL�a��j�L��[�W���4��=��o6h��*�m3��*%.�Vy�`D�؛n;q��c��N�4�u�y�c�/A^�����8�&Ro��(�Й��Ba�h����`����hYj-�'U|ux����y�&8lA�r~���a�tF�j��\0�"�P�fJ@^v�x[k�i_�EŚ�^�E�IW�����:�G4����q'ߩ�q���c"�C���p(S���m���YH���&���D#�i�Ech�(؅�1)U�1L��S��ci�q�!�֮�c���-�j�F4J�n`�"����qL�i�P2q<���� K�T��ӑ��£*����N�����Ob�u�hlr�m�q>]�+�@�Yh��X���H����E&js��z�X�N+H&��|�I
%A%����M&���iw�#I���.:z�믚dU�����R�+NE�|ҝЩH]�)I��l9o�"����!{I��/i���iꊪ���{?Ji�B�n���]������F	{�c�6�]HP�yg�{���z��b���9Ѥd":�� 4Z*s�=].��т͙IU��(<��������a�{��\��/��OK�2h�#�5�@n�"�~5�73 b�ۇ �	G$�,@�=Fl����@>���&���E�ÈzJ�Q?��yX4E�C�Њƞ�u���[��_Q]��(YZϡ)���BB�t�k�A�6E�c�#`(r�O��ML����JH�RM�\��ȃ��.��MF~u�IOMhHaE`�[C͵�� %C!j�v8���c�1U#Dc%��@]dg��~	��0��OC["@�_x�#P����w�� 㨗$Q�9٤��.��������e��s$Z� C�ھ}�e�ƒ��	�!V��6��`'%G����F��Dj]a����M���J����Joo��HQI��B���������-V��d%xk�XY/8�J�hS"�������<�!R��;o�'�>fL�u�pBc��M[zZrY�W����"ˋf�a��4pP���P������yjyA$I8<��K��&x:&�4�8����Nkq�fF̒��ΨuF�I�틖(��跂�d6p�I�mҗ؃��|��&���f`%+��5��`�R�\��1(q�����=���sB8���-	����"N%e��b=h�h���	�9ߟ��� �\�샑��*�Xo��m���XC�����tj� ��6'GD��U�H��$ʑ9ln�������3�wn7X���$6�}�i1�d�"rȡ9�W���r-�1>l�)�4]U��C!S��BeM�����kʼZ�|h��X�[�v��7P���,Tw% Q{�8����W3�/��k��JB/���=U_'�fK]]}���Asx�xM��V�h�P������|�h�zy����e&�G ��L�þʸq!���8Zv�~�;�sZX�qfc����h�a���/j���g׀kS�.� eCV��p�YH�cr��vy�Ԙ��*�A�R�̊�}!)pI/v�z�-�q/;�	%��mD�D5�u&��n���3G�����<Ed��?ܱ��`{gS:;8���ˬ�`��\���B��drc�Ǚ|y<mۥD쬋�&
ϒ�H���5����k��S|aǙ!L��ؾ��!F=�?�9q�r~=FH�\J\�bqQ����f����_(�q�_A����1#�"]�bF�!�K'i�Ǚ|�}
��ï�����jB�%�D]�v�l��OQ�N��J��6qh�	�'h��^����m�&KJT������R���w&�DFq?�?@�\��5;�Z�?��U9�urX��P�;E'�*�#������Ю�=˴��O���;E���,6q�P���a��()�p�J�93|(k�`#�)���_is#G"�@ā�R���r�˚�Y����rZH���aѝf��c�LR�9L��j���h�}ډ��*�A�"�҈�|�VG��^=l���)��BRe���P�B�3n�A�߫��qGl�FD
K�E��{����F-ݍ<�|���C�Bz�ղ5�>�j�nJ�9h�Hq�O�ύ�Q:�^p��ȡB��x��}��E,5x⁯�y#,��1����u):ܝ�������W�w�]��s#����|��t��wG��Ky�I�E�[r�j	�s���������y�Nq� �o'Wc�_��/%�j0Ȏ%t���"���®=�c�\�8p����(��v�@L���̨�)�:��Ԕ9�A��r��^�^�ov_pX    �1�P�-t\� �Z�y)�ÈN_V���ގ�Z�k���j\2�!Z�X9�݆��;<~��e��
�{��XƬ<tM��*O�	$S[��L���؟��ٱ8x'�)����꘶��e����!rɈ�u�8��yH^�P~����m��"n9␏쓬����BL�g�dɛ����L�#S�17�;R�S�΍�5q�1��m�N�B@�����OFT1f�&t��bj$�pޞ�Ow�A��u ַ-����n��JL��,]�t�4�k�)�tA�(��BdcA�k`3�y�e�p)�� bf���ÿ�����ѧ8{at�'�*�y%϶��Æ�{n\C$��b[4~G�L�1�%q� ���q���*��=]�r�p��9�9Z��i8�57�El5Q����ʊFn	��}}�M����ي�z�F��;��Jjс!$#�q� �/8�i��E�������rH��4�[Iv��C=�+v���f�g82���%�����,�V�"�B��^G�+�U�U�����v�7�Z��S�{��c���=t*&��">ߢ2�X�W�0C*�O/��m�t��8x)v�n�Zi��l6�a�-�ߥ­FX��s8��bЌ3\�M�(���W�m=�� Q�V�J�E!"��\,�-�P�\�b�U�m1�al�:���q| �.�=B����K��R��
��Xvі�nQ�0��QvI��/�'k��۝�<o�(�
"��M���~�N6���\ܾ���Kg���f���AT\�ͥ��m7=���Z�˱��Eƚ�T�ƪS��B
���,��Z���g:w���vX(:�$'�:�r� �m%��?��E�*%���0Ry�^a�r� ��`�>̥��Dg��흔ha9Z����f�Z#���:G^b�[�"�J|�k���������Q�2��Z��E�;���0A4�_�oZG�m)P��ySf�ㄑR*�@�`b��I��(|��~{n��֪tC0���c95��o�����F����1���v�|��nb�Q�%��X���.�;b$�s.|X{�������m�8�^;56
=�|��C��Ck�+�r���1��o�;Zq�(����AdU.˴).C)Ӎ3b�X��VG⦾����1#Z�(�d���V$�%��9�DO�rNټm��4�:��:_�'
L��/�r�ZƠ�����[c��\߶E��r?����|؋��Ji6>�Z�T��֑�{y>4%���P��"l�� *����Hk�b$�(�vWp� ��o;�>4X���R�1�E��d�9�у��EJ#�b�҆�v��
m��8�x��Ξ���;�Q�>��{�3#{0A����M�Fx����g;P��_wDӫW	m�@�R8:3�4�~���x�Ԛ�0t%ѵ]JR�g��
�D�]^Ng1r����=Pi��~0a��6rlr���,b����m�6���D�D-=7�]�ƚ`o9ϑ�8�K3�jM���S��S� �ͶO�{��8�?��Pa_�Y��cAZ:f�q8�D�U�B��E��1<�4��WF�0�,ZdJ�稲0IW��66��oOH�;0g������g�T�CG��CJT�E%H�.p�!2���mR~�ΥK�Cx���X�a�I�c�:� ���A'�F��Gs�q��y���w�Ӯ��L�>��1�J=�Q�Fd<V�!��	��1)��K�R1���W�~�m����ǜ�F
������i�Cψ��~�"X��U8%����3��خ`\I+�R��4��
���8� ������K�XD��o���*����C>[����Ig٥�1u�Q{pH��A5�Y)��9A^xF���Zq�]�u8��������.U�֚�HҲ�c�pC�ͯ�3�n��c���Ķ�8�a�#�j���ԉ�.+4V�Tj+Osy��{f�P�l��\��Qe��X�baҕ�R��]4\�����~�n�������h��_���	ԥ�
�@N�u?I��u����c��ڋD+�����u9&��Q����
�BLJn$��Ϙ��W�k�L��������7#�r����f���(`�����A=���QR�2ÀXF��������\�?z��p����d�-��q�g$��!l�9����ڳa����İjǙ�j�ɺg�b�ƕ-E|E�8}i��!Sz��ob'�V4Ǧڱ�X4�$�R�	M�F�Ӻ� ���&7�3�W�*�WE�����
uC��5������eI�H��D�c�\WE����n���?�ڧZx��J�m�qV03��j"NLi�h�:�(��*"n^�`��]��n[n]J������
��˰�����S��V�W�]��jS�����@��&����KPaFܣAm`K�I��5&�@�JD���ɩ	�+��W��0��Qu��bE/c�����q=?ވd��e.���S�'Ю�18��L�ǧ����S˯	�+�qB�ǂ�c	R{�n�C\N�;e��F�K�t�p�(W��Z[kCaxK�$׏z����p]H�%vձ�l*�X��c�;aR��8���}ˎ���+�W��?���8������ϻ�Y��)"�q���6��B�"w~��>)wHiע(�If�	�\���k)Բ�r
��¤��A�(�s��`�b��=7����V��|~؝ ��Ç��t+vxE7�≢��s��"���}��vm'��ҧ.6
�.Q_���7��'�<�����	����S���Xn�-��;���H�{N�UD���y���5U1Q��2j���$ٳ�/�4�M]�@c�Khmq#	���ɏXo]J.��� �����h��Uc%����Ds'�j 2j�h.mZ��A��%�����/�V�x�?�_��b��B�9�eO�OBSo�¨MK}��s���G!ˌ��nF	FV>Fo�,�eQ��ի�]��mx-dy����a+����9E�/,ڴ�^�$I��#u��u|�ur�&q��l���%��@3�t8�3��jhf3�z�<�Q�8�%��CƚS#U����Y͝�f�w��Ι/�X�� m~!Ӧ���|�;P���]��Vc%�CV"{��"���Z-���|��K&R4Tw��-)��}@ٸ�Hm�mm�Uے�+�jd"�\�~~.wP��ʄ�u�6t�R!Al�d��� D?��ߝ3��z̎t!�Dh-�R�񚣍�۩�߰C�Č���۱��O���y]:��(C�>/�n����cU��
�p����9̨��l�+������UPrMcȤ�����سX>L��um��UŊQ��ŏ`��B��C~+���X��@�B7�ΣI��r�!c�#�Tw���W��.U���/]�w`"�|�j������ߛ��фr���]�::�N{�.{4m�=d��}� � ]�v�Bd����(����w
���^s|!+�t�QO�w�i.��1o���r ��`J�Zi�F�`h6��3?�i�:�I�?�Aۃ�� JZ�w�p�!�N�� �_��T�9c�!l��
7v����s9t��[Ii�8�h���AuA��'�Yr�$ʂuo8�������p��;����Q:w�{�O�6r���a�t��/�D��n�	aՎ#g2�%�S7r=��Q����y�g���N�4Z��?��OnXEL�򈓔EPJ�	�yo���g�������{휴HayÑ������e֦x��
;�l��%�(8
�p ��,�O���St9o[z�A8�n,N2[���������5��~�a�J!~��Yl��S��.�P�T��p�����Du`u�����mO��K8����MOc�bn���6��Pk��\��О��b�q���f�W��@�);8����q�����یk��	�G�R96Q��[(�ʰ����N��y�=���l��F�԰�^�w*o!����[WTNƿ�χi�%)�k��o�ַ�:��U����F�������4-6�5Ő1R����(˱���ޞN��~��~    �(��X><6�f��ϚJB�q��!�q��̲�������N��+U��Bw�uG��-k�k�x>�.��ʡ���؋�V"tq�ł�;:�ct%�6wT<����z��
и��<-;.��A�����С�������_���C�Nh�#\D;��t��ԊԆڌ�@'u��k�r�3�m��v.F7�UaE���`]{���w��<�f�?��Z�M�V=����:	2~Ͷq�,c��Y}<M���<�@W��ˉ=�d� ��j�p�?<�Z���t��r���4�J3đ�j��=�}�n4���w�l3qO������0��y��Z�B���rt����'�E�U8DYϿ
���N��#0�[��0Y�xɅ57� ��ƎC�L&h�ô\Y�O���ǯ9Jy��:*1�1H�w���nU���?��Ќ�^�Z���Jj��xE�xE�y]T_�5��!"��Z�P�0x�H�;�[nd�!q�q�������v���%6k�.��|!�T���ݸ��o��jN-�he��xy+�"�bo�\��J��A����=���}�j7)��2�TӗEׄ��Z�H��a���9�஽y:bĨ�y.Ӗ���]�Kt"}G�sp�j²Dhw�U�P6�8���![#�Ԙ��`�5bTf��MI|�p����қ~Y� ��{�Q�N��u����v�AB�>p��KPT;���h�9�u���+��K5�E�v�~�=tT���bv+&��;�W.&ey�!��i����,�NM]L"�1I��F:`��gY���� 7��U���o��b�.�F�u�ifB� ��nn��a�:���x��֔DTJ�~GA�O�<GT*R|��!��=���(jK���j"���<�!�J��.$�l�2��q!OW&�͍SR�[��&��8X�D�����i��)���Ap�}���+g��̞��t�9���g�n�b����>y!.�Vg_ֻa������Y�VY�(��4��G�f�����Aڸ���Mb���t�@��q�����@��9�,���x�3}��S�&�����y:ˌR�f�Jِ��ԉ�ьr�p�����-N9�M�C��)\^f4���E�Q��{�5p����,�C��a0g�A9�5��x=�qӭTu�æ���Z�_�>[�9TDI����q��M�)|�HSd�N")��:�G��lv�Sf1S�v���c)���T$s�v/O(ǝ�֤K����a�¤�fk�0 �A~�l�a���!>r@
e�������bI��+qDU{p��|�X�إ� v��F����4�#�jn6Q�84��8d�o�l%�#��/�3����cR�e͢�������v�2�Z".ΔΈ���:<�2�#k�D���ܕ��!b��bP���#Ugf�B���I�x��W�S�ƨ8j��� ��UVo	�G�WT����J�Ǣa���/
���#��:������u�����'�ڑ��u��6���}�HE��������ϻCo��WJ��6z��t��6v>]�`UG~�=`AJԔo�bC	�N"v`��*1B�ǘ{~x7d��k�I�n�<�=�L�k�p�;.����P�CUz~8��}^�F�ٔ����a��D�O���󟻇�i(I).+�I�}���'{#�	k�q���"�D͇���G�6P�,3��*�����#�(���#/�����$3}�؈?x�Y��	�8QE��S�3=�'�0$�h$R���v��������Ej)�G*:�^��;	(.D�r�nd��@�����*�o��$C�9w�=�碕ؙ�rj�S�
Ze��'9
�Ȯ%|�����7�Y���(������a�F�����β�]�	-{L8�I�ϴp��,)Tz-���E9wT��Ƒ+[���#D�:Q3U%�_6�<��3��X�e)����y�V\p%���iX�#a��=W��G9q�C�u~��ˌ@t��z��tɸFv)��?�J8af�������~�;���y�Tˈ{ �A�� �x}?=~>?���V\F&X���V\�=�`�F�H9���]o��O�BX��8����� �㤱�(Rfn_Y�`�w���XG���N�0#��RX�#�����C�>�?�;/��ȃ�Mܨ#��(qRK҉�?��vAˍñ�R��d�h(�1K���ڏd�AߪV���Ǆ����퟾�pT*@QGG�J�;�Y��n$�$��]����r�EK�8�������t�&���)��~H���!�LQ� LQ1c���b���P����E>Jܣ��ᅘ}{ɚ�@�D��u	�I�s�� 3���AF׆�������#������ytK4�a�lZ0���A�c_yv�i� m��NM�u�H=��7H�|�}y�������|e�A����`���A�F�J�0t� #Zr:TP��Wb����QjA���D�ZPظQi�s=O�z1�.e�!�ԡ�kF,l��f��4?�D��u{����xx�A�(��Z�R�����+�B�+��{��e���[,�����nu���N�~�^�034?�z��w:o�R���i��MZ��i�ب�~b�iٹ����<`;܎�4F�&4?�ĥ+��eq�G���9"�����F��i���Ħ�D#�F�B��j�4Ĕ{���33{M3%�j�(�荫F��`^l�J7���E�p�x*m�_A�L��\�!�?=B�:9�����{�Ϗ���B5a9CV:�]J��y*n��:ޟ�˧�Ug�鵡k��N�(��p�1<
u�gy<�w����d�7G�$��M��1{�ZaG'T�p25�i�C@�J�;\*k9w�V*�.@��Ɓ�D!lx�t��f.ʄ�d�n^QβB,�?D�{���+�v��#FK'�b��XZ���#��v,\x�<�b*M0���H��,3���B�J�V�(.
���U+�zyԂ盍��̣���.iQm�{��mՄߑJ�yd&k(���jU��yѳ�!�I���q�70 ,@kP��F�R|ו�	y�WyŢ�휯�<EZ$����6^�HĶ5��Uñ�(q��=��檦�<���bI�U0��� l���x[�,�";�ڶ�b�<,��lDE43X>��
�jw�� >0�#]�0 �y"��e w�g��n9�MV���}�eSz�wj[R^��BgRsXSAb�q�x7=<"Ǧ0��E�خn��q���(��Eȵ�u�f3����TE
#$-pt�Q� *T���2;�b(���(�	3e��E��'v���fH<E�;�[�J��f�4�sU^��o��ܟ%��g����1x#d'�4�J�'�n�j��$��hd6�o���=�}����]���w}t�9&.(|C����b��8��QJ9H��qw:L�������%W?	�hE).*Qb * �cJ�#\Ca���+�g�J�3ya�P>̜h�FA���t?�;����f����k�{D�#+���|��ZaM���WO��U^��+j��-�8vP��u�ބ�t�2Lv��(��c�-/�?��Cs�BQ߼��4��68(�KmV��6�
VVa������I��nޟ�~����PB�����FD�?(��o�'��CE#K׈��`��`�1>�~
��h��W��	Wmj���ŧ��C)�9��.��S�h4�S�	� BI�T43��YTvq�7�����.xym����&	��s<�#�����Ą��'�	%GGgp�z�S8>��P�st��#g�`r1�v�u
Q�k�U�RP���ȮMx��7���f�p�L�iwBEtw����T|��Tι.-g���-|&�b�4E�Ͻl�<��:c�J��������-�M��PSMVQ����E��xC����!�V��ps�Yy�b0W�x���*�t���]������S���*��KZm�<K���I�j��9(�:���$������=0ջ>ʨ���D�S��ڣ���PK+�G��JўZ8T4ɦ6b�^��](zw�a6?���9TQD��?v    ӗVo�D8���a���].G*]G^��Hk^��1cV)2_�d1�SRB��+:)M��P�-��!-R(uk�p(҉Iѽ1?2�����ه��x���J��u)�"ON��B�'�ԓ��鰟��bq���ڂ�����4�"���V\���Ҽ��c���Xk�HCq�p��Οg{i�5
��7�-�J��m�SB���xs�Ïfm��>i)�m�#�m�}�6ԛ�2��5u�a��?��oc`o*���tO�*"�R?�&��ZśX��(jc��>�J��0���p�8���Q7�a*-=]�R��@�� #?�w��´c��|����N>�"���@�ū�-s�×ijV3zbtٱQd�|2b�E�U,��ݷ0j��v%�A�T�9dP<��y�=�M�O���MY�aQ���F%�%�ȑ���EԿ���yv��茪�w��Rkj�ލc'����v{#��""�R�SگU6�.Ud�	e�����G��(���"��E����9�>H;:r��a���q��e�?6��R��j��l��T�.�v,���� c�Z�C(������q5�Ҵ�m�B��A1�"F�s!,h�*�B6I_���¦E����x�tk��� ���A����@F������w��eAn�Qw��M�AU������R�̧@�b������)�3|,�ń��
X��F	�P)���Vk��n2�8zPi�c����d��FW��AK�"q̠��*�5Բ�a����%T��In<T�����I����!U�� l�V G��|9�=x��z�)�S���?��4�?�j=+j�_:M�º�O &�i<=�F>�uM.��1�E&��<2	L;�)?�E�w��Ԋ���j����yzh�[W+=p���I�I���v�#�?.r���ݚѐt�0��:�"+GT��r��aӜ!��<�P�z-����c�%�p�j���AwO���q���K���0fу���5Z��@`D�9�B�8r��u*�㮵c
�Á�w�2ݰiƢ��cg,� Ӱg5�r�Z�8������qz~|z������$, eW��|7J�i9~�:��yD�,���;xē����ͼ,RZ`)�0v{r{rc���Q�J6�3�m�$���$�V~';qb*T���������,����		D��Э�L���d��8~Pu&U�]o��3+ �!��Hmp�%�
w�*���)Q�����|Ȼ��Ud��i�f��J�HbhY�.��	�c��vت��bU��TT=������MɚG��n���x�����AŖ�^�}1\>�ߞ�L��=p +#�aw.q��CuH���#�\�ڝ���Y]�;&�,�T��5��G�!k�!�OQq��BK),�%���}x��>1�&*TH	2�0I�̖�D|K�N�N*�T2	2Z�,4�X� N�Eg��9RP���=��P"��� �fb�u|ޔ$4Do�9@��|�������UVY�x�W�//�uV��QsH���*4�o�c��ʋ���Ի')jT�����k]Ol����xgm���h�|/	����+�L�f]R�ϩԢ&����9��:���.R3[M�s��I���f,�YXK�^��2�m�q�E���z7vf���?�6����a�(��O+&ҌJLd���xW"sۇ��KS4�k�lШ9@P}���i�~9@�����1&w���#�V��)y9����Ũ9l���7P	xu�Z��Y��b7��Vo����h8��؋j�;�����Vp��H�2BhBf+LHD��@jm��)%�Vx|���&=��wvn�q$9�V?E]�O�!�p)moϸe��<�{�n�Ze���j��o��������Fw���*��?M��bP.+��{s�8t'yOu�֎� k�!�_t��Ո�6Z#�O�}�H�-�"��-���Q����G���ܡg�n�P���Lv'��e$�6��I};x��%��Ed//v��]lϷm���,��i�t=9t+"vY!_���X�:��SJ�z��	�;a�{Z�1fb��iO��>&��$�	�������Y���IqA}��h��Nk�F��e*q�H��V�Yu�&��"�a�4lش*�=	��j�Ϡ��GO�sc��;{����2���T��m�����OA��X�X'.�2������2��H�D�K���r+:��4h���n�y¼;�c�%�Ri���R�U̒�&+�R 6�Vd�Ӏ����hG\��@�U�YY1�лr7���2�F��Z���B�=!Z�,/vϻ[�-X�-���.�^�����%$A�l���EU���E�j�f��?�g0��'Qt���h�ߨ�e����9T��j5Dţ�Ķ
�����Y3A��.���ѐ�
�`hը�xz�t�t�^� ��f���a5\G7ȄVE�������fx�o�ߒ�����9�Y���XtS}�L�f�JK��� Q�dsn����O_���s�
�Ե�:�J(.D��)�a@�҇�M%R(�KKbrz��G؎��F�N�x�|�yC��������c�uh�oÍ)�;y�v͢m�f"�����*Fɧ��>��kH��4ʫ�Z��R�Qe	��*>9;o���О�ȫB.��?ڝtu���P�El$�D��$ۺ�\�q��v������,��k�'�5�O��VJ1��a8��+kSIÄ�ʒ��������e897+jU5�����hU��8~7w�CA�iw2��ͷj���D"+Z)�wϊ��f�,TS+5�O�t��xs\ �Z��h��I�w�'����0��2/����z���;!)1фXh���'�!�#�1�������x��Q��U�vY2A�:
N	a�*J�nw�S��^��Řa�O�Bm��0�lAnI&�����"�Ye'��2�w�_9K:_� gU�|�{~i�!#q�:���	 �G.@���Tr�4IږغgyS~7І��czVJ��n�/��+��U�e���c'��e�4 ���Υ��Q
c�/��}���x~�4?y�"���3���a�yVE�wo�����mCjZ jHQ�,�YMF�%��4�5�i�<�{ٚ��qJƋ*�,�B�g�JK�z�̧�-���O�4���|�{��5g3��8R1M��,˼Ai��~EZ�/�l�o�n����Zz.<��=25�^7��Yy�Ġ���	G#��_�I�n�ٵ�8Q��@ї!�NQ����^,�^_/t/�r�Xl�X�/��\�S��}U��	��>gH�"���gj��2.����ԟƠ�Y긍	b`8�p��
�	�Ur@��L-��l�]s����%��%��c�˳\$��51�P��^YESub���;t�_� k�,����:O/����_���Z4c�]^3S�Ƥ8�ԩ�t� �wx���W����R�O��I`�{�O�&��@�F�e�¸������b�F�6���}A-�����<,B�nA���t49%ؘX5��g�<>߆��m����=�N��UV�z�[[�{�A[$�s�����A}�.���*@��I�O
�%f�^o֐b5���o�b\���\����t��U��+�g��~�G�]�%�U����%*c�̋����%}����E�a�6�T�o&o�Ӗ������S[��U�?��Z{�k�!��NF`����e�(Z
����'�mZ�(�!ٓ�A�d��#%��گ��X5B����6
���3�kRZ�X5�^��_������1g���-M�5���u6�;�U#��b]�&�Eb�T[�:�(���yQ�/Zѭ���Tq	iV#4�U��>��Wŝ42�V�Lkք4���R�k�����S�^�#�n>��cIAގV'\�d5B�V�-a�L��t��c�S=u���X����˾q���-��e��dx	��v���@f4vQ�+�]k�v?����D��
�)�-��'�n��YJ��k!i߉������yS�_�I٩���41�'���#��:]QG���U��˰?�ۓ�n�r�eڍq�B:�h���A��E�+B    �^�74����I�Љ��x�q�Y���q��xe^�l,����/|�nJs�~G�X� O��á��D��L0$�IL��&�Z�1#k�-&�X����L�^M�uҨ� �$����^.�\(�����\�)�C�p��)CQN� �Έ���R�0A/���Ǥ�,z"g�?�Y �0N��3�QBI6��o�'�eDf� ���W@4���4r!�M��t�3e��k�mGFp�8��çf����[rIe���\KؖKe��ݠ*	qY#����2�;�U�ZI�MZ�(#+k����$�����ˮ�v�8��y�N�iR�~��t�-#;k������82w�H����5U}�1��Ah������X&��H�d�&��<}�QKIZ#$m��.�2h�����YeO��ձN@��E��5B�^Ǧ��6����=a�C�V�12�F�Y2�2��/��&�۩���:e݇p�lC�����\3*Hi��.i#�4��e#��LsKI�<��/JFUS3r�F8٫�4f�\yo<]��hن���p��U�z+�JKN�$�ٝ׽#MV.�x%���5�oM�; LͺU��&c��Co������fON��8������E~4E�i҆��X*5��ޣ���Y�S/���e�	]ƨ��1Z'��/G.s4���B�J�"����0Ɵ	T?��$D|g���!#`k"_�����e�|�#��~�k���͔�!OM��]+!�H���Qs�[Q��D����p��k{�zW�o~9y7���PH(_"����5	e0�h��x"HӢ�@�1���m]1$�"��$�ę��稒�-��{)(Z'#�k�y�s�����S�F;r��XB9N����^?���d�>U5nH��]39�*K���dT)e���5ɭ�k�K�����tK2�&��oQ/Y��ƧsDbp�qjVX���5�.-�?y��V]�U��'/:�k�n<�(l��K�'����).? �m��^��O,��Ҳ�+я���I?�d��f����ꮎ�������دI�'��>t���Bp����WF��;eX�?���eW ���h+�=ڇ9x?f}�6Y���*�%m:�?��M#�H�l�5渨���F	�#۸W-�f� FOs�]��^���������6٭}��8��G�Tλ&:���)o��z�AJ/��,{��L:����3�+�?��xR�Uc�X�N�zx$͉iq�{�crU�+
���I�i�1��b�G��H����?�7�*��l~�,�����4�$L�L�������g�[��;�	��f����4�:{����~��xV!^��O�n&�Q�+��9�	L�d#x���ׇv�'�6F�RtuՐ(�Zm����"�||�᳹g����6eENE���`�4�Ix �l��?>�����/*.lӯ@��dU�FFJ�
�|5Z�#�P���<�1��誁�>�֒GKUX��;�l��GWƓ��6�m߉0M u�2C��O�U3d����W�F5χ�W8�����k�N���U�Z�`�z��kzE�ݟF�7&8֔b�M7#���8�� �����BF��
�"�4��D-�9ڪCշ�GSЎ	�f+d��7��~��1q���ß�#�%5�)#�le�0:������?uj�!f�E��nU_�e+��x�L�ޘV�U`>�ͮ�
�]�d�2��f���D85�z����_�@�d+��'�+���V ��P��f��A����^�B/��dח�fpـ��:E��;Y˯[35�0�.��uǽ��z�_L��8��+�zP��4^��O&�S�ѫ�6Ʃo�B���j�O��7	z��وno��$T��w���Ҏ�g}��q���R����.�ix��x�܁j�RF�
�\-��A%�$+{^Gd�1G�Kz��e �d+x�h�xs6g�sx�_���^���n�Up2d$�������֤��˼��h�J-#�l�D��Hv��2Y)�+�����k�g�������x3i	�陾éq�P4�e#�r�6Q�λc��=�(#�l�J��Tѱ�(5�ذ���U��dk'��E���T���~��DRkm��6y���M�V�iw�BֲE�}�e�1u�ؾLL�(~��q3B�V�����ˮc�<f�����j	��4���ѽ�x�I���t2�w�޼0��we��f�
�1d+�"ofx�Qi3m8�n@oJb�� Đ�`�+ɹ>��v!��ʉs'e�?�6���P�R�V(��Ge�qUV���`��#�g��:	^��C��!�E]��P���z�D
�
������%lb�����ĵ�c=�7��VX�����&\���r�K���Z#�C?�ܨ� �4m���AU\�
�A�G�;�2�S���5_��ԑ�t�u5� 	�,�>�ɹb��<��st%} ,�_\�����f������H1�r�҈/�gY�1'�l"Č��h�������q<{��OD]��1S���&Ԧ�,W�85iC���>���%�_�L���_���B+9��.���	�X���K�����������ˈ [����k���� �b���e`�6����>t�$:ߡ����f7�x]��*�G�uֵD$��7h���?�mh�Tx������g�j
vUt�93&��� �{|�=߆��a����u�Q�"�k�#:�N#�l����p��9�e���x����2�$cz��W��
�E�ŭ���~�jq������ZccW�@�u}9uٔ<�?I��۱S-O�d[��.�6��q{�3-�O�f|��s�;����CU�˫M��K?��&�X�� 0���>��l���U���7:��`�0yͦ�:U�����r�N��xu��ʗt?���5,D�� �dz�n`�Ȋ*2�ѽ���:2��V@��a��X��I�Ǖjةu�IS�[�I�� jf���ZEO$���xO�9��=���J0:��}�8$y�_�=R���Db�
���A�������p	��/�?�'2t�-��%�;�*o�<�� �uz}�R\B�$������3��!���e+�25��ߔ&����v�ʵjt�uQe+���u��׳�؟���Mgx3�+�NI0���%c��8"�V���%�{��y����.F��������#�)d+��=�(�ju��GBV���I���پY
XŢJ��L�"�na=��ū�l��i�l)��-����Xʋ��=�Q��D96�s�C~�
?\��g�u旍��r��V�k���]�#�*Ϳ��f:�����ן�7>�b�4f�9�f�:��>�3\�נ�PM�0���z�@�c϶Wg����<��ך���Vu��cK\���Y�W=q_D�J��lv��v��Bȏ���}Qd��^3����s�_�X������>�����}�`|���,4�]��`T�rF�'�wa:D�� �b��}6o7���R_޵Cw�[�c�Y�F�yd"�U*H��XON=�^^��}���SRwB�V ����?�����5����)-s��*�h��$�Z�_�e+�2�0�툓��O��̑���#Ō��$���.�0[A����4�Z*�2����X��U��f䘭p�ח��R��.��4�+���O����M�,���5CE�ԟ,�R螥���L�P���M�ҝ�:��LIM[�e�W
��c饍e��}�ߊQ�IL���ޙ?��x7l�l�6��}dQo����/Yc�Խ�lB͜��.�&���v��s�.#�9�z�Z��t�@[a�W�zGi��]aah����?�3�7mX|Y�I�;��'�g'�����
���2^�N�< �!�l�s.&�UTm��<\��p#��"��%z�J@Nɯ@[gοQ�ki��ǚ
ЯB��w�zU@��
�|��NM�e�k��aW� :��A�!�lm��R��@��-�L�вh���"�{n�� �T�H��:�C:�
�L�T�7��$�Ac����(����<Y���7������)X0�)&�Q��d+L2kG�M[$�:���Y�U䐭p�l��ș9(y�
�wX�5 �   �E��ӏ6��V�c���?�L��8�=�0f-8��ڗt����t;�����[�?꽈�š|Ƨ�ZDUU-J*��N�T�F\���8!.m�G�-�jpu�Y�3������@���{|��6�$���X"7�
s����[a��|�������T���k�ٞ ��<�m�#���r����ɐ����
l6}-4�͟N�6�-lzPs�U������/�,���         j   x�e�A
�0�ur��a���d�g(HE
����K�;�#����k�wdSW���˶����ط= P�Al�������j(��Xd>7n�ʵ��M$�TS�3�ʚ#J            x���[w��5���+�mf��	 ��d��RK�9$e/{}/�f�,�.:u������D	��u����Q���%�#��]g�U��W���Ż��O��^�T�UUM�v�I���$O*�%�;��-g��ø�Uq���W'����X�֒���8/>Ŧ�JL˂����Nw���9�~xw���~��-Zk��A��l1>�����lu?���
���o}()l�3m���_��X��jWX;�Y�;op�_�8o�4^3d�@�b��0�js�2�u7.Gh�~멭�FH����}��|�y�7�i-��}w��r��]�BsbO�ƞؒ��������=eKg,}H�鵙N����oae�S��w��ua��v�����
^z�Wdx�]�-�JkH��]q=ޏ�*�1><ѫ���5J�?�ǭ1J�d,�6�qQ\�K��ݽ��$+j�|����lL�r3�g�@��yj݄͒��$����݋����lh��m�ٿ���x��K �Ii��A)���kdB����|�N���F����g��6�[C��?���Ca��0�+���7��5xM�c8z윚j���M�F#�b?.�eq�^}[/���c��$&�&��&���<1�o�:�5JMW���l�=X���J5`U��LS��T�J��4��lu��8���ø���������C���{�����ˌ{ V�>����|3_�C�)�A%e,f^����K�mu�r���W^����u?�h��~�[%��(��ƥ������a�<�SM`�g�;zh�8��˔�N�R<F�ޏs���U���B;�xX�T[+#���s���vX���v�4^m�t��0m0�l�]�R ��R�5`m����~\�\�-G`�z̶[%ɦ�:�a��հ���q9�mf�̈́���w l��i�:�\۳��|Y�-��vZ�ޯ�v� �� yWE��v�!���Ư�>틋q5�Ҧ�?1^�)�r���	�3t�+v4�cy����c�߷��oG �(�v$�	���́����`3e��
�US;�Z��#դ�/^4'+)��ʼbe�D��
�'���6�ǖ�2ivi�9�^�������X\�i]��������uI�Cih��/�.-:�J�Ug�p���|K�q���mo®L���5�Cy��f��|3�u��v��$M)��L����뢍���|��~�urT,��/��ưc������l�)��7�&<�+�h%� �4tCw�����a\.�;(�ٟ&J%�����Q㵮��q�4�����Q�}O�wk����iG���cڬ=^{�\%Ys�����=�L��G݊�s��F�όLd�i���O�?_�׫�n���aGc�&�~�7��c��I�ԶX�Z���Rþ��	��g������Ӹ�a\�~	nZ?"��	�͌K�ٚ0;M�w��.j�b��2�،fٺe��o�i�*�Vۇ5v5 k�N�BК��kֺ�ڿL��E���?5A�@{��z�����z	��nݳ��o�ʎ�0���<t��b$?
�~�z82�[?�z���oK��	#U>��F���^0�+�?v��7�h 7�/���6N��ATc�ۊ�!�x2�]ړ�hH7���λ�>�?F���cNk�$�:�E->[t��6��F�ql�a1�i��r��ɪ�SXY��D|K��|��~�H��NH>`۞<@8u�I�Msh��{kx���]o���il7-�^����vZo���㺦MC��Tf�Y��vӱ��b���^W�y;���z˞�����hn͗��4��8D�ݣ����v�G(�^g����VC��x_(�a��j;2��O��q[�j�&�L�z��9�H�G|�����,�u��4�[�6�����z�8��o�%Z���<[�6~�*����cF�%)�6������m�XP�^�+@���m��kж��f�,&�]�9�}a���m4$���A�-�w==2�WЎ���	��	T�/�J<��o��]o�۰���^��v�����R&4���Ed�3�QmX�$�~�N���_VO��?�[�~o�2���0�!��ćq�}��zï��������(�śq�Ğ�O
�t�RR�Mf��4r;B��x7[�!�S[��˯�`7���4x;�ʿ��?����G��wc�G~w� �i�v�ګ;�RLg����}|�^8�H���p����o�:�`|5������pb(�"}��4h;�uq9���_N[��:H�.}��4`;����>�I�~3�W�v�>�J�p����p����E��#��J�pH��^��#�^Ϧw:�f؈t�-lkr˨����g<;��v�ap��~	-�N�作�hO���b�pDǁ�H%�32^�^#�'�����֠G/D)��gzC��'p�̖��mq=�l����m��b>}�u�c���^,"�Uǧ
>]t�!�M��c�����o�φ��A�G)�N��+{�׾V~�?���۝��{1]FN �I�װ�e��r����iO[\�gf�;�+�2̝i���=A���b�]������iAIќ�z�ݞ���-w'����e����K�e僆n/~���U���.N�J�-U��;h��:���1���=����x��MY���i{�pp�J����F0���@�[I#�}�H#@w��:�0K�g�A�zp/���~ ��e����a=�/��Qc�mpGg�.����?$;L|h^6�5n����QO�年�N�A�}h_6H��l��&��n-.��4��?t/�`
f�K���P+n��)S��`xً�����B�L�==UM��%=/�y��x@xK�`��1�9
����퐛��u��za]�Xp�BbF`"8 5�bu�@��Vk3�9�h xYzQ�3iz�d)e$1+�ba��r-��5V��3>�����31.@�:��Zi3�6��@� sl:r`�8�e�ۦ����W��f7N��ոa� \�*)�1d�:ՠ�tld���g!WōwCy�"ܲ�nw�n��[�d�m��`4�0�����m����=l%_]d����4�����dhE7��ᖤTR,ԙ!�a6P<mquST��y�=�eD�ZZ$\��9h���i�-<��Z6Z&q�27P+���@8r�lS�=Η�q�������V�m�a/<����A���ޏ�����Y�d��[�d�ܛ��ϙ'2.���������Ҍ60eڕМV��g�{۽�B`9���/��Q^𨧮�
���O�ԏ�ځ���|�Z,�X�I����S���?%}$����<��O��?�t��i�����#�Wl5���9)�=�����d��D��Q���ߌ�Hf"f�����x&_&Uk3�lK�ވ����x;�"��c�W9q�6XD��=l�߂�3�2ψ��s��^���Y(Ü��L�<�>�=;Rxd�Q+����q=��.�2��暟ָ]VRTg՘e֤��T�sϲ��!���̗�T7����:�chJ��.C�0VÕ����?��I�a���MI �q�̕<PO��E�Փ���+(�4R�/y>���$�-��QJ�����e������s�8a=ܚQ���gF�������-�*h��' i+��y�do��Ӹd����0_q�;�'xQ�f�N#�ɒA��H9�&�HJZ�9�i�Y�����r��ӴI��7'�i�c��2��Nc����������mg��|,.`>6�͛,�Ω�!�0�̘������~W8#2�� ��o#��G��!�c&L�����i_��i���i�8�O�MW/�֐f�$,]�q�,��L���,7��5��:y��~?�JXT^YVj�h�L�2[�m<[cNdC�1)L-�$���Y���̟|��4��C��TR:��:EC�	�P�cZe������N5��0�~�c�N�ȬݑW�(��͘s��Z�)��׫��/P�:ld���+s1jjd&J�`���S6w���F�p����o,��L2NNSk3e�/�r�x*�&~�Sr�A���VZ��-�%�2����4.�p.��]�3x��^s9��*�%���m�E�~VL���W���    �i+�S4V�5��x�����xm�!��*A�����F����K�?ж\18�J��asH[��e��3+�5'Jy���F��|��k��pWJ�sĵ���@��ܱ��Pf�d����܁����-��6��1�(?�� ���%Iܤ��\WӷI��̡�p���~��W�e��,��G���f�&P�.iBc����ꙦYB�O֭t�k3i������)�0u��VB;�[�� :����!jaZ�2=�j�2M���{�Ճ�t��2JYn��r�j�6�����z�Qç�'�\��>��l5L�C�/���f��E�f���O'̱�NX�'�܃h�6���di,~�?z_��d���RI�H���aۈ��;��wsL��9��JJ��f�VC�i��O��o�����'>��2%^��@3�NB��xn�h�b������R8�2Q��=s!hZ妏گ���ֻ ��*h�Q
�r��V��	���#�X�����p�J�I������vW�m�o�ѽ��%.�Y+�\c�i�����<O�x���PI�2!�N>������t�h&@�JU*��\���43%�����/�~�+�g��݇1Z��C�X|$�_&�jd3����~�x���qE�����$YͲuf��4��=yl���d���H#e@C�)��ǧ��O�GΔos�t�L�<P/^9P���c:�g�P"���0n��d@(s~�$m�'22��2{�N�������嗌K'�X.�����i���5����a ����a�(>=��v�v��J�����,����L}�yj)� z�|:'*(;�hz�o�=^�6�m@2��b!�"�%Ukt3��b�o��pw��.��>Ċ�t�k 3��p�xeZHrܐ8q(�(���5����%�A�=�L�ɚB��<�˙*w��kwl��|G>GP�Z��I�%v#�ٖ?�h$wo�n�~���FN���~��2���Y/H�!�����1�{O��H�45�����K쁿|����Aø�xi�/?϶���`�3�{���IC]�J��H�m�� 0ϔ*z�B;eKûw����K�S�1T�Yz������4��:e��d�V���m�9=L�����g�$ٸ�)�P�C16���7^��z|�J2��aV\̷������yO��8k�B�(p?J���z`�d���������VJ��>�'/���;B#�f��t��h�@g�$+&ͭ��Rɠ9���L����ëv�(��1D�2L`���F=s%/�W��N��Gz9��J�;�}��0g��(���ıL8%��2I*�kfG^�W�-xb1.d�9l�&X[i�2'�r�}�m�f����G.�`�f"�uL��J��4��c�Y�l�A�I2��iX�}�8���VڎF7S#)B%P����`F��r9�l���lH��c\�h))��h +{"E]n�j@3�1j'�����Av����J)נf���#�Y	�XO�Mz����_tl���V���3�0
�¤T�I{/o�$��7�P��ˤ�HhӴ2��g H0�C�"�6��j�ڴ�F'9�+b��l%�ffw	e���]q=��X`���S7-𶌒�K;����9���]����y��sY�V�?��HZ�9Ҫ�|.�D^�Ww��ݑҐ���x(��q	���7�G?�>�~8`:�*z�L3^=��\�6Z5aK5�8���>�j����G������oh�~���rPGb�����ߠ�F����O�A�fqfq�������?�5��� �1�8f#��s�s]��R�� ��̌1\y�����\��\��g1���^V�:ᰕV��\����l�@�x,��[p:鷼᫯�?�Mh�2�z���Ɇ(\�K))��Qi�a+.�Wca���r�H#�W��\���9��2᪉�Z)�������iv/���'���Y�j6�1�����x7�����hj���8�&s&sEݤ�;��Rqfr��y\�y\̇{:�j�o�A�)2��ˤS�r���v�씖9]pnE��J�9]�9]��[PŐS�MwtVS�S��ik�~�V>�Z��'6Le�e��e5��0���i\n�w�<����CJ����(�@�;`5��0���G�-���w�������Yg��l��xۭ�u΁w�������Z���ʫod��e��u3n���̋O#]�ᩑdؔQҳH;�,�����iZv*fd��3�n�_�F0Ӹn(U�5t#6,����f;F����nn��խ�}>�����+p�,?V�(%��׾�&4��0�k2��N�O��s~W��S�MS;�V4�˸��������z��?s:D�D	�su���	�G���+ӌ/�܁��f=�9� �/�S �N#3�4��8	=^~kZ5j{��o��&��&�N:���*�8hl5��0��f�]f|�K3���TVDI)�2���
4�0,��(�1^���;l��k�3�kҾ�x!�כҍj֗a�������i�+K�°�&IɗB��:����/�į���9�B��;�����0=erzX��2����g�@�����.��ČX�w�ج��)�N+.�t��Z#G��ru8���;���b�i1����=��V�+�*�zٟ�=1�"���<���
;N\��a�&8�M�l�\.����
\�=ȉN����xO�������B��W��i��f�Ko�4����b�������:��'Y>c���N)��>*����_�1V�J�/����gFNdu���>j�|��H#��(Ւ�>Rm-�\�QJ
Ds��VC��пn�t6�\oz���'�����/4A�jp�VR6�9Oc�A�G�I�'M�$�V�S
I;ȡ�~9��eֈV���пM{�;b|[��x����e,�(��w�]᳍Cw-��RI���ݣm5:���t��v+��r]�\H��	�=u��,���4�j��M(Pǂ��c@��	���ɭ�z�T>M��O�i_	��v�����(si�;�T>O���Ÿ���g^쉕��!��N����w�^�����?�N�5d��������� k�����~J�M���7�N�N#W�O��o�^L[m���Uc�+)��:_>[��}ڗ�;( ?�-��m��k�� ��쬷$붝�1|/��d�� Dڑ4@EnP���@��l%�t�كG ch��𞣔�y7:_�+���e���()�͐�m��k%���w
�Q��=HY3	�l�Q�g�He�D������C+�X�ϲ{�Ɣc��Wn:l���E8hdk����������ߩnbZ��KK��p��D��$����6������v��8�E��^��I"������,������$V�Pb���zU'9dW��b���5���L��Q4�����zTr��M��~��uB�Z��<���j7n�䈇D��DY$��vʄ�)�T���t).��<���ZI��L ��5X��z��3��|1�!h� ӓ�����R`ȹZ>���¹�~/�^�}�::��8��kƀo��Qb�	�É;�=�+�$��N)� �c>��q�%p���P* �����4iޯ��zD�{�:uH��L;Mfv4d9&ɇ�V��@���s��a��b[*�#�ig��吤���n�K (w���<�֤�k���F���sZ��t����!?�k��A��c�����Z@���ǀ2J��N�֠嘤�i�_��3{$ݸ�U�2��
r���A�����D��8�"+6�j?��λJÔ#���{�e����k��j+
�R6����4H�O��wv�R�-ܠ��Y����\��<˻JC���\o��0�/�,�^��4\98i�Oq� ��#���(	����k�U����vZg1�GV�\�k�r,VŊ@��.3ڀ�WN3Wi�6����#���g|�s�*���(���֟�ħ�x��Yޔ��U�M�қ`��U�H��X�S��|l��l�:8G}:Џd�"���
EP)I����sD�T������g����m�/f��]dI��A�r]<@1ai���V�K"G�V>�Of6ٯ������rj�!=����Z��|n��P`?�!    N�RSO3�E�Mձ����>I�f9��(��Ϡ~���}�hR�Ӈ��TH��(�x�J��!��[��=��w�٧w�o��ځ@��E�E�T}P��ø�N�
�*�"k�~��y�����L�2ZK��H2/�6iF�W��p|S�(�vTJ�3�JjY^��R�ӥ�/xW�L��㿳��?����<{Z�V�E��S������;��lBP���*��*!�%���K�(�:��Yc��9N'"O!����'d<	U=�F�V���Ydv�~�����k�{ �N��Q���2�Zg5�ً�a��y�ܴ�M�H�|9Kw��E)��vpVc9��\"�r�����<�ӧ5e%e8e�[;���rn�Gu�W�����r(ȹy�Q�k0\�J��n|j��#u�g�i=+������i���;j�A,N����Ǉ�����4_��&�s�R�s�!�#B|�J��L$�s���&�n��{f��2�_�JE�0)M�*<8��*�iFX߮�ŁF�T⥒�3�	��@g�z���sđ [�+�ՙrA�ix�+�/����BU=�*�E��#���NS|�8ٯ�3�n�)���g�ix�?v��� 4�P'�9Mv�~��-o���:8FP�R,�!!a˟�ۧZÓ]�_�O�Q"�hR��j���~{���w�F)�f>`$�ԛ�%mS^k�'��S��;�#����ki�vJ�Ƭ�igwp�c.fV�(e�fXܮ֨��x�羢ωT�:��I���ݬ����f�o����(�XP����į�f��;�/�KNNf�[*��ZC�=�W�,Q u�|�G_Т*U�2Lq�!��\P����QN,�"�[�n��fW��|#]Cf@���2f�ɹP�g��^O����sQ�&���)'�B]���>��6��p�ҨFZ�nj4��@	����
�TjR��9�k4��k���n�@s�P��(���B�h ����ﮨ��'g�~+�TR ���r�6��	6m����������ANQ�zi�ԷZ�M���+���?�D�T�&��zM�s���z�6�:ǁ�m�B�-�R��b�^b4=��u�-��ޱ��`�SMp������"�TJr�P;�;���,���_5���oj�(+�*�:�ܩ&8J�i
g7��%.������ldQ5�]�mL��y���>=)O;�
)OR��GGFU�&��?G?��݁V��K�ȩj�������&J)\��vX�)˜��f��j��ɫ�����'RX�$9��I�ӯ�M��k5��B!柿ӓ?7��:]�q�#�T�rJq��j�����T~M0�j��6��k`K4�{�*������V㙽'���Ǯ�NvN�%�M��>���0m�#�F$�B������Sn`E�Uf����L�o�Cq���k����_?�Ͼ��w���5=A���r��H�j�9XX���Q�E.s��ܫ�`�������y�w�Qʘ�2�Pd^����q������w��e�d@�)�6�.BOs8U�3R�iN�aB��M��"�=�����4�o7��Pb,%%����괉�TN����VRv��v�_�q*_n�O�ギR��u���Gg�2Fۜ�5r��0�� `��T8u�e�<w]'n�҅���Vr��5�yZ�W�u1>�fr���=��
2l�3ۚ^#�gs����`�Ț����NYѨ�	<a�*3�1%����S&��5�y&y��}Ⱦⶬ����6��κ�:��v��lA�^�ȓ��M����`�����.���0���lq=_~�,rS��[D0�PE�T2�̴9\�a�Gq���h\��+^JfR�4�.L���W\�9�(��F�m�J[�	�.R��x��^���sz�k���(e2�P�\$quaRG���b�p������.��Zk�I^)��TR��||��Յiܯ��,���ʻFL�@D���F�Vfo����J�����������8r����){��������rr�l��T2���I��Kʄ���H)hѴ�fP2�If|�FRyo�06@�zK�4$�@r��W�K���@�kc����O7hXʌb����p����II���.���Р�$�4Kӆ�_�×3P��f�]�Y�L�Ә!���diU�6s�s�o��4Jc��� ��F���X�����.�Jt��­������֕F,�N�j���dW�+4�為Ҁ�[ɿ����������(��oK]i������v��q�t�\�Ps���Z*�J#V2&`�\�)ֳ��(�G�XvG�r���1���ד��ۇ3Z�ua�O)�+`���:Mh�����q��J��L强����翿���R�����f]i��=%��^��xG#����?P�Y�2wKr���a]����|�FC�vz=!\�V�� Es&�am4bm���R(5�%�D9Y��Z��!k���}�}7��1�O�^3�5h��RO6 d9�'�NETQ ~F���T'�q�c�����TRzf�L7F�թ��p�q�����۸�!J�����glm4j]����苭�{����#$#�Rd�y�F�6�%�=OwC��$�*�I�f�d��F#�I�o�[:�"!�i�Ѯ�(΍y��*���\��5q�p:�M����;��V�U�RU⭝ָzSR��_��w�z.�҄�nSR4g�j�˗�*����i��R�H�nP����������3��,���J�����*�g�Ƙ&0�d�!i9x�ZJO����,_��]x;��5�#j*J�չ����B��-��'������jx�R2j�ݓ	��F`))�3���jt���_O='j��.�/�P������+)6r[a�q*Q���*�4�)�\�� J�x���f���x�ur��i����όۊ�ģ���Ӡ�H8�}Z��#o(�ؙJ�����v��1�>(���VH�C���/����p���͚N�[Ĉ#�������`��I�~����Iz=z[����
q�4n�jVp�S�v���%(ڑ��=W3Ȼ�j��̑���4��麿?�E]<d�m�Ԗ�A���q#Ib��-Uk�r�!1ni��6н'f�צg��- ��v^���j�Z��$����+�ʚ�5��.�=�Z��Z�MJJ��f�Z���?d��A�$VX|I6Ą	�3x�5�C	�ot~�ū?�3�d�P�~j����[�!͵h��7���V��3I�Pq]����5��,�w����O %ɖ�P�E��Oi�\�每���� �V��U$�PM �ǲ�'M�kt)O3���0R�B`[I�����u{p.��_�$t�V��p�#�N~�����P�R4��l�ivM�,%���d�[S[��μ���%����5�; >�X�P����� �47�9��3+�X��))5�����P��4<��q��6(̅?��kF4�[�s���m<�{��J� �s>�F㜋�x�a�8sL���o�\���E������#h�s���a�C�ǑAIy����� �r7�>K�$����4�ZN<︝R�\���O_�-\�"��� ����8C&�A�h�w��N�/0A u%�@�W]7�\�r�+b���cY#5ր}���?s�V7ޝ�7w������-ƻ9�]j���Hv���sG^���h5�;F8��W����xd���%IkG��=��f4��,���Yq3���o{ɂ�GG�.S�XW)7za*�E)�;��9z.������L��N�NSUS�!3S�z�R97��$��H�g�(i �lZ��Հ�M@��L~��xT�|��;Awf�j�sa��	�P	N� NH�Ai�]��\���@�t�F�CZe����Nڭ�5׺�F��tM���Ƚ(9rJ�o�2��[Ը�C|?)!���DB��@����;N��6����x�����g�@��y�U�wѨwW�WXu�����7�r�yOk<H��.��x�tN�t+r��f,�i���EQ���iKٛ�l9���^�t���e����d��;�U.zC�'�r��;m�&JQ�fbQ�N#���������O6    ���&��:]C���<�E��A��>L�L�%��|S��+�N�ypj�G
��yD��$I�2-?Q��x�iLz��4.�}�=���v��d���]�]ڂ�� 5_���i���V�?�i�}%��5J��h_w��A���)r�������!�S�T�Z�}�z���ߏ�Q�9'z���m�g�	K��TU�mI��y]���i�翫��B�F1׹�<�?��rW�W3A�Ϸ� ��W ��3��G*PW���mے$sxJG�S�j�.^�x���f���P��r�9�i_���k��F
���~����@�Br�_������$>���V��5��!5q�Th0E�I<N6:����>жΦ�5���X��75�P�Ki�s��Fy[}�m�-�8T��D ����~�p�����g�l���pyM�1h�ř�u�l���u�����q��dG�N���H�F�n���%Y�k�c��;\���au$m���t����(�d�u�����ֹ���y'�VE/JV]��^$k���u��0'T�Ҡ��)���L,d=h$2U���g��ȍR::å������!L.�$媮�W�҃CC�)[P�3���M���a��R
��H��h�zЀd����cF���81�9w�!GC��r1�L�5�鄊�'�H�T��?��48���M��4ς�����Ҹd��h��p n����g����e���|�Y?�do;P�p�zz�z�J��he���bZ����-rCٵ��9h*�W&k����93��݊�I��2$��Ґe�����cA7Ҕ &�\�Uf��T���"�X��˪��RIQ�9�4�F����5��#G��a��ۦҰd6���i�Վ�L(G�CE��h3�iM���d���'�Zk���bJ���A �g����r�m�F(�(UIk\�� L9��_��@e^��IG�o=�f�ď��[�TrRp�)mF#��N�������8�Z��J���2,��h��!��o�:N�W�̕Cc4j���-)Ad-���M���"�`ʚ^�I/Z�� f�֯>�=?�?_��^�k��e\��m��zK���h����~��~}�bhG�BEw{!��A+�!�� �˴�yG���~�}�ܕ�{�Nq���1�Nn�}���x�3'�ZH2V*)[�L�Bc5����7��b��{��[C|�7l+�캗�#�a�� Y����ոe�3�GCY�ސ���.�J|��q��ݞp��S��J%ei�dHh�Flb=��
C4���}�a�d��b9>�1Հ�5త$�2G��j�2Q�(��E��u*Ȱre.����l������_��ރ#�P�:dV2Lƹ�˔�߉�ހ�ն�,Xg&إ����9hF9�Zʖ��)�q����4R�SN�[���ӈd.���-}�^��}CpX�4����%�W��.IR��T��m�d#I��}���G�k����Jʛ��h��d/t4K�y��R\��*�4(��1�H<�����ӈ
��ѽ!.�IJ��F��b�k2�����+od�C�{�A���=?
� }!Hy��ӳq�L�b+���jJ����4N��9W����lꦛ�f7��XT����	)�]�Pk�2�*�k���q�TR�f�6��,3�H/-� Z�i�5`Y}5�7m[��R�c���N��Xe~�P��[^�@�ҳ�S���ͺ��*��>��@P���r@X5mn��Lt�<ގ�PM��X����\y��$�j��6$�?�	#tbņ"J�V��I��He�����Ne`Q��Ƒ�(��2�����F�a�J���=�R� "�KI��L>���m%�u��Q�l
J��խ:!�g���[�V
�l��}���~���	�$�dx�6��vyBSO�p��zKJ����eR�VO�a�]�T�leR�7��.�.f��^ �L����֘e"Ӥw7��0ۀ"ՁMD�SU*�PX��.��b՛��7��X�,]�7+~�T$0AQ�����J)׈e���85<�ް�'B}bs�5P���eΗ���UtT\���@eZ�%�XB�))?8� ����p�����q�ld�:!�Lau�޴��9�m�|Nl(�$v�Q��M��F#��(���4	�i[D�q���tw&��i5{I���}�ٽ/]\����"���J� ��Z��^��VO�	w)��vڀ.�$�n2|����d�Q�ȓm�O��?՛���V�IH	C�Q����d�h��M���y�"�+j��>�V�8��^4O�\�%�e�jd���0�F�j�MK�d�@�,�7S�4��X�@'<\
��y��d�l:��A���t>�/����X\N�K��D!�% )ȃ�r����M��?�`�B��}��A�+�Ũ�G��R�tz
l���0G�S��&w��4����td*)�+��NOCl�/��4�X1�b������uz.`jQ��ۘ/�F�.<Q���L�#���l�����L��W���n�G�� �g�mtG6(�{��G��~�z&y���7�cQW2��,��>�6��&vE��.�̻��u4�0�Ko�='H2�$3�{��m��I�N�ʖ\1#�o��I���iK6g�PO�.A���,.}�m��B���{�|P���h+�ƽd�(x
Z*%�謺p@͠_��L�o�,և;a���5��T��)�ϳ�����'V:i����#>��C���y�V/Y�d��\���[�*��hF�� ��d�<1c����i��¤P7G��c�t%!l�X��Ύ	M�2�7�b<���e�/���8�)~J?����t=��p������Tu��|ePk��aN�����Hϩ�@���$
PSu�I��Z�9I�;_0l��{�!�V��e��qi&&�B#H���$��/$K��UC�>'�x֤х�Y7�&p�(]O�����"ۍ)�$��l��Fs��$��/o�	�����7��e��t�4.���¿�͚.�A��0�+���t��[��I��_o������o�rZ�tR�M�*�(Lu��[�IJ/X"�����7s��j�a��O�����]�A4.��G���ç�$.�L���f5b y˂㠤��ס��-�L����zCz��n���M�ؗR5��=�a̤�pǁc/��O�|�G��z�\&/��w�F���x�7�Vo=ķ��e��t�����|��l{J��؇�:���!�ܥ�+0 ���5��Ӥ�@� e��v�!4�����j���I�s"ŧ)���mdx��~vKY��h�C����(|5�[ �c*���F��)�����E>���iu(�n�aL��}!�ZY�DD��K�|�!�Էߧx����yx�Q�j�	�h#�k����?]_~�7����I����Q+���V�l؞��v����))}�a����5�z�����i��+D�A����n�%��n&<q�W�0���0���G��w�h�j������ni���+������o��F�g�M��\=tP��9QO��ɮ�l�!L�vF��lN��</K�Ϣ�Y/s��iU&�r?ፐ�W�Q�� e�v�Ek5�MH��Y2�<n{��Hv�O�V|J���Q�V��w���V�!{ִ��hSk5~c��O�9�%�������7��C��e��tT��D,4�d�zZ�!,u,|�e��NJ%e�Ȥ?j�F��FTY�[K�4�n�k҉�;��~���o�0���C���2��AO�@7Ȯ����1�1̛Ə�	��� w�x��~@8`��l�����j��4�Lܔ�$0d )뚏Tɰ>��~d)�8.�{ ���i�1�C6q3ƿI�N�X
%NXg�ig�4��A�"��{E������|�����4��n�A+��)Q���<j�JC;�&=���T� �7�T�䨝���r�nw>��(&?Ȧeg��m�3&4�%S��v��6I�t@��v5�ek����a ��N��`��ٷisO�n0�֞��W �1�<x�_�R+%;Z0�t�O�9�5���\���~%���V�_�PB L�2϶�ظ�ix3��K�I<��3HiqG�ۆ�'I[C�،��u�̂�    ��/t9�s���s4H��J����$���j�x��[�`�?��4�K/-��X,���i�̑���t��>�y_�{�@o�r?,I�*t6B��!ky��k��Mg�;P~���vB�)+��ȿd��f�@��?�/��&�&5�͐�/JY}]N�=S�/���/?M��ĢQ��Y`z�����̢����(���p˵��,�ZRp��9J��WN���T�^v*��+&�)9䆓۴�N?���X�m�~�2~��Y��0ϔ�ik=p���٣�Ӗ���;8��l���[Sxbf��PN�G@9%Z-�0y����:�/��v�u��^��+)��!h��Fz�h��4��F���Ho1HAXn+�hX׊}Qg�����n0um��7�����vP�(/��㦗������v}P<�x&9_�����}y�f�aѬ�by�J�/�����}����͗D�D����Ye�J��T����	?kn�#nC�k���y��/h�*'a2�$�F�$�O�_�A���jKb��Z�N�S����c�K��@���nO�icz�h*e��/�G�JW���ꏧ�f)�{M�=�x:I�����{m�����q~򶡈M���s{fC�Ꙥ����������k��3�RQR^\�zp��9��ȆO)u;M��8���a҇!�&���5�MÀ�Dr�g0���F�����zzk��/f>�:����1��r�#)�p�/��S�$��W<���!���2ʀ���m���	\�e|�����	L|$�E<�	�����勲e}o�T�Q
/���s#�֔Q�Ӹ���ك���S6�y�"L�m듷���V��pu�C�fz>=uK�NTQ��!�_o�������F� b�pL��
=���'�{5'�ӎ���Tfx	m����Bp�9:��qwT`쨕�靆~�2F����L��{�J�0o�`Ěie��Y��U�|Se����	����G_�s�>�RI�/����g�NC�b&�����~���wN�Πߨ�0M���iDs����f��c!)�Z�%i��0H�4�S&4�9b�띟�~�؋�\c��K�|c��>�1�35M�N#��&���8���A�p�Q�{j��I;�z��@�*GT��>�p�U�\�m�aݙ�L�-��7�����Y����W"�Fz)!W���i�"X.%&�/�5����r�^��7�W��srW�Fv���_`i�]:��ħ��:2t�Z�~� �(�����4
��?�C�G�^hm�-����A�|j���x�Ћi��'�;:
PII��e�>�Ŗ�#��t�N:�H��qP��\d�d)���}K�/)a�]���?��o�n)����QNv����h�s|���8�-�2��	���u��������d�=��S@ߊ��C��ٝ�]ac_{9zࠍ��b���7o��рI�"�ģ��q��8�.�
(s��+���$G\4�9V�\�r�J��L�_;h�s�i'W\q���u��[f��7���ܭ۠�!�~�v��_C�AbL�$�"e9�24�v��怌��N}��#�4�('�p��6���)�\nS�q�����l�X�9��������@��j!u���cW����8�@��^I��0�	��>��M� ��k�@��	.;�v���2i�%��R~~&��8�n�t���PE!�R헕w��4d~�-�A�U��<���[C��5ql��u] �����X�qt83)����sB�pP�G��^�@w� \��(���/�]���P̕�a\"_`W9ꢓ.�S�P+�L��u�}_��d���o(Au����čw��+�7��z��C�uF��'�U�q�I[�U���A?7��p�v$�k(��U�F�u.~����)��C���]�F���T*J�R�ZWi �C[����)��Vڂ�q�s(_���eS0zǜ�Xi&:�h(�c��MS�����e�SSR��Li��h�2�����b�"+d-hڥ��8�<�P �p�)�IF��l�QghݥU�D�'�9��5~��ᏺ�ʵ�l���Q�N���,���F��0w�]�yvϵ@����y*J�$2���h��"|Zo�k�������z3,��h��c�ށwT��1���tFY�>g��b}��'��@��s�J�L�q6tF�W��;�:*F��7k�Y�3���h�ڐ�]�����(�Df��Y[�f|���_�|��O��F@�A�/$8P�2�:���̌��rί���(陮��4j�f `5r�.��iz�c���2PwV×�\�o:�?0���3`]+)õ���j�2C��_7>;�	�5P��Rɰ���>V�W��~$7:*��tjjȹ�;���L��w`�)\G�*�܏jn%$�6r��j$+�sTV���땋��Ld5��q\WSg�»hԫ ��j�e�Y�Oߨ��j��:b������CM�U;�f��L|�̞�)_�x���j�P�}g�uN���Eɷ���/��f%���f
�A��#��ծ�o�@y{�B�4��bq5�����w�`���b}'Y�a�h��vv�q�L�80F�<����i�b/���um^�O(�ڟ��9��:^�X7m�����*=�ly�%!���)s�9k�`�%_��G��:GI_@�2L��'Ѹ�z�3���wI_�S����5"Ԕkinti�3����'(>rj˴W	��\�~�5���?=���e��{��L7�ܵ�N���PG7={H�d&��P�~�r�Q<���hkc�Auo\e�h3&���w��Ձ�v@��d�,U��6(&<`��!��qԒ�kRg�urp����;ʪ�Z_k�[G�_wp�I�,�p�*)��Lb�.��`��Bv���6�_�5�µ���^��.�ՠ��PL{�;���N`%��f(�Y�%��m�K�pn(�I�c#�=�ՠ�F�'n��w����Y�@x�J�7Z���P��
�۩#j�;p�QY��|=�.׼������r7INw3�/|���B�r0�27�|aޮ��B�wd���su�F/{��V����c͸jVy�$��2�?�߉�2���^8qϐ�è����|�hP����;.:��_(����?\C��C���L��J�2�R�	y��!mB���A��i���Ԑ�t·p�<P]�q��!hk�b�]��I���Ү�8���mL��Q6PBI��Q�z���ӵ�R�"X��R�Ք��\�z���Ҷ4����8�a�~��W��Gb6$9/)�"%l9���vv̶�R�B�=.�9D�UU/1E��W�7�q-U.��v1�c	Ҵ�T��qHwR���M�Ж�bd���� �D室�2˙3�mF󽦑n�BJw���ɝ�蠕~���Q�����-$��o�)�u��A֬���Q���"=X)�������-��x��u�J?���ԕ��o��4��6s�	:=X�
<#�;8coI1�u�vP��t8�\��e~s�i��J)Ʈ���;j%{�ӰvF��7��ԡ��n�Uk@;���
�ͺ�(���+��u��::�F92(�m��Nj�F�k�R?H%b+:p��G@<�%���4�٥��wkz��c�i�B�`��~�4�]�5��m޾��4Z�����n9إ���d+�$�L�]f��4Z]wh�,��=^����{U'u"7�����'�	��|%���;����H:�Q��������֮��$��zXv���<��Wy]���/I�����2�kԲˈ��W�2Y�,��2�4ҽ����"�~1�=�ů�SE�4_�%_������f7��AS���1��x����~Y���W��.v��~	��'�$�Wf��5x�WW��wy.pgA����:�z`�Q����f���
]OYɡْo0.,N>����z�fv!�Vp��q90T�^e��A�}E��j�u�t"4�F���z��?�	*W�t��vȠ��H�8O���� �cG�D)��7����2�ÏB���R�CAtډ��;�A���e�00�LG�*�9�>���    ��P1�u��U&�7�߼g���%ǁJ��q�4�9��{����z�d=hs����aAU�Ĺ[�����k�`m��3�аA`Ud�Ĝ̒[�S5���}�q���܏'T�˧yrH��e�[/�����m$��f9~���A�奒�5]���W�����c�0�3�B��S�J�cZ��|����[��x\Dm���a2�K'���W���~Z�%�U.�5��R��v�kжRAn9�
߃�u����/���]s��~��/��-.�z"y%h��7oD÷�Rr��>��DH�J&_�0W!��Ӂ�ep�P2,����̱-����f�t�zU�fA�^�Jh6����|��Fؑ�\��C:�ua�Ch��r�!�-�p=�0���>����%�EST�|�|d�i�m��F(�T�,��l��B$��$���1��n�W*Z�gIb�ј吕��O�[��"K�Ʋ���R����*�]�+|��/��wA-� ��a��n�o��j�r�ʇ��{(-�Xq��y�&_�h�rĊ7B]�<w���S��h������a9�C+���������Ӂ;��VB��@�H��+?1~��0���������Hz���I�����|���-0��Q�xis�50{I6E�+{P�*�t�H�Jrܺ�N���]��� sO�XL6�!��k� �����\�=��h-DG��������c�'4ï_ˊ��aNO��z�a��J5-�����3�A+��5{��ڭ7�gύ+~U���+A�!5?JIY�^Y���)��p5¯���yZ�&5��Hr�`C�S����i��Rm�i,�����������ĉU0�ID�;������Ǟ�g��~�~xA?��� ��'O-��E\-D��J��67S8�!����
���B��RIV�d���8�3�ϖZ^�x���]���H\�u�p���8��tr��qP5H��h��d�ۧ��kX�u{�(�]fHR��X�ΤO��i� ��?��%�Ņ�)ɻ܆��)9��@x�tp����1MP9˖v��sXe;�LN�v�Tp!�Z�B��N�U��Yk��
��1M;�BwD�>���k�a8Ќ퓣�B\�F)�=�ZkQ)�!��l�i�S��'��)�;��\+����)�DO�,���lr�eM��:^����T��'�&��cPӮ��ǧ��_��,PS4Qt.P�����/={��f��߭��_Y�x��3#ϐ�1�k����4�]'�E�� ��l���n�(���R'ԋ�\�988w��N�X�J=Ġu���8E�:���;ה,���i��] �� Y糤��g�\,��1)ޮ�q;/n>�b��'FzBS�$7���K[�X6R>���d��� ��Gְ����5�J
ux�W��:���TR�	�Y�5�JJt|Z_���;���c����e��
V�)����r��^���Z��lqH#�uL�h27+�&aI����f��C�nG�*x��3A륽.S�(�Bz�jd�&�X7�G������ᵌ��p��f4�M��|]�AJ���f�F摐܋���{���%%<>�o�#�Y,�-�ǃ�%9�K��,���y|�w�����HsJ��g1����\S��`�Oh8M��4��8u���`�a���Vږ�7S�>!�_M�6�����x,�����k:����<[�hIK�e�I浳�faI���%~4m,��9�i�T�^�e��Rn��	�^�b+զ�;^���`oahGA$�w�� 
�I���d�5�J
wp��������@�BlKɮ ��5?�Ǐ��1�K�� �]0M ޿�L�u&��T+������_��zM�7�V�EK%e��{ߚde$�OT�nqT#�I���Zge{M�2�7�����u���l{7���4X�e��9�;$M�2L��xW�<��]��~�cΌ
�R�5v�su1�m�-M=�Qb�Z)���7><���'�\	$]#a4V)��ɤ�5˄��l�XW�Y�b~�J�^��L��6͡s�m�g=���yI�<v.��ܕ��\��'��!���L��2��z:yf`��WFR'�(D�o��G��b�['��W�ǟ �+1B4+	�?j%�k֕qRA~3[͠�G��rp} ~�*��q 9ӳ|J�Nʾi��2Nj�#"�\ȿ��;�y7��,����u�Q�����y��u��_�W�q��J�u�p娕�M���h>����0\��P�Ku�X�z�C;N�)mNO�L?hm�ɳM;��]���w��}�4��k��1N��?Y������q���"Yxۥ�O�T�5S�����~���/����r_��*	Q�u/��|-�|�����t�L-�&�$�a�2��^E��%��j�j]P�)L_=y�hvR��|��e��u1[��M��/�ˡ�	�=�Eq���2X�Wn 4w�0wk�su2��O.�D�P��W�O�� g���U�-��UJ
�3��z��2���x�mU==����.��ʽ�5o�0oK�`�L�-
�QI��MN�k�m��!�S:.U�Jp���\��^��Ă��������>}�=:�wJ;��5ę�u��T���)�i�W��<I�{��F�!|�M�aRV\�!7����B�i]�M��	�M'�y��S�r�����竁�j�Rm��.��.ok͏��(L�M�p��N��v�$/�$/�@A�$9'b �T)�ǙR3�_��z�z�=�����/I2��a70rp�i������7iы�u$��O��5͠i^�i^_6��c ��5�eWW*Rf��Yҗ���z�z�uy��v�f:u��W�S�+�fyfy]�������@/*�n�[���f~�%<8��_�����:�>%��d��@��>�Aӽӽ.��jPD�B5%�V*}�4��0݋[(�O�y�����D�ʉ߭9_�9_��A=.�T5��8��3
�J�Xf���ڕC5�7�Y#���)^�)^^+�6^ў���<���w�wA/:䮊f�(���v=��e���5��C���D࡝ҫ������>�9]m v�%=��)]���%+��� Z*�r�, �a;=244��P=�H�O�K$�^���� �&t�N*���ǻ����#���\Ǥ�ę���au����^Y5��t�*ɷ=ܸ0��&Lf$I?f��=B4����`�S�HP/�l����iKI5I��0���jS��x�	�|B;���f:]�D���ٷ�k���5ؘ5|��7"m)E}&Dz��1���$�>����>G���E/q�x��Xd�@߼d1hF��M�*A��e�|X���^�Oh�mꉢ�ʦ�����/@�Ͱ{PR���{�d3ӻ�,��E2��:4������5����g���8J6B�={��+8�1�&p�W*?>��7�n��ҷ��<�IPG5�3n���ݑ&���{��/0��V��Ljb��_�Z~�I��.��&���y�zJ�WL�&�g�����L��A���PW��k�����m�>%�-Mc3�qY#�E[0��RmhЌ63�#`Q���G�X����
�3d��V>��gz�Kf�o\|��$�UOh{�]���2�G�.=q`���J('��4<k�_��U��Y�f\�D�a��p�
��	z/Iֆ�Vd��Dt�g��y�o���Q���zE���1�2w�&əA�(��SQ|^o�S�lu��9�9��f"����l �+	 M�3L��\}_B����X��O��s��s\�j�����b�������QҤ�xO�Lg�LG�PL�`�^]�X�T�Z�r����GOšɩ�X1��b�DȘb3SM���@�>�D��$,r�����d2�|V�ч��4�"�$��4�Au �*I;�v!N�e�ͳ�̳#�7����)2
���N��x�p1���Uf˭w�w���ϟr@��wXf�6�kc����]q=�y������(Y9�S6h��s�c~ی��@ywx"=8�V\�*�wM��L����4:&` ��-exͺ�̺�wp�Gl��.�m4��2����1�	@j� F   ʝ#>��$G��k֤;ˤ��b�y>��:J���`ax��}�f�mv��޹ƹ��g�s/���� r?4�W"����F�yRB��;�]��21v����Y��A-m���3T�R���үY���v���w�\�\C=
C�ԏ�������̮��jY��3�g���(���Y��M&�w������?@��͞����V��4��2��z��#=Hu��7;^4��2���`£7�Qg��UR�d��Qg�Qw=N�h�Pb3}���C���9��L��Н� ��x��g��j�ڐ~78�(�r��6��Z�ת��D���_��?��A�3�݃h{���B�M��L��F~�THvi(-��信�2���:o�Z?��Ǳ��}qX0�#����l�hap����6ٔQʾ��\@�Vgm�L1.�o��~�t�]hj���3p�S�H�BM��
w���4�κJ ��3{C��A3묓��>C�.�4D����P�簕���L���v�`,`�9x`��fx����Y��Mz�(����?�9�����Ԫ1�j���$-��uH�t�Jw�ƪ�E�σ�F�𒤥��EQ>��vS��qi�"d�}B4�L��)Wpk�D:�:m�����Ox�ӶB�OHKiG�Ɔ͔]�g`�Iu���:T����ޚr���dKs���Z��6���j�RVM���H:���)���+4���eGo�O(4�?�0]+)��Mך=g�J�_�#��ǈܹ�Ib�Ttgh�(e�S��4�k������W�S<0��BTnȺ���&�Yɒ�0�,���g*�h)�P<(X��fތF�$˟��M��X{xu:,������z��t��y@��_����6I�����w�W�� I�qY���\+`�9$�`i���R��W2@�Tg�T���{F�W�ާ)���(��k^9�h��e��7�;/T�ՙ������C��,��|��OjH�:��$��S�f
	�Rg�Rw�_x�	�I)S�����Nu����"�	z��]��k��|�GV�� %�ڜ�L3�,3�B��鐋����y�!�����Dv�@Ps�,s�|�����䆁����F)/:�+Ӭ:ˬ:>�s�\<�i��Ke��\w�\Ut���)=�4��Sw���Q��4����g>]T����(Ń&�Y&�E�H�Di�%v�$H����T�0g�0���3*(soK�k*M��L�;Ԏ�3�h%ñ'�J�J��,����F(��y�,�IR�F+���z��^�����uq2��c�2����<���mqu+���
�,7t;��A+cKC��r\"�����sa`�����:��ݦ��l92�������"H���3��B]@�z�@n*ͧ�̧�'<?�x������������*�q}��y������T�[g�[�6}J���|_Ș����t�#
6'*� ����z*h;m�(I������#o Q��[���x���9s$��W>��âo���%s���3S�|z��HH@&E��bVB�˧2?W�J�,��F�s�{CD׃78���F�	�,�t��������^;��f�<HƱd*�ڳ��{���N�g�������`@�Ͻ��e/gf�3�W���+�aSiF�eF�]OȂ�tN[o��X�1��8��ҽ����=7BV2�b�*O�"O���>��L���wG��H�U-�ֽ��T��g���
3`�5�#I�}I�ߚ����}��}d��E�]�v�s�n|��~�37�ĖmP�8����)[�wZ� �S��,��n��4ر���]
E���W��选|7��^7�;d��2ݦ'����W�������:3,cSi6�e6�WK�88x�J,E�$���$<�$<(�P�/�8�!��G`Si��e��;('z��Q��6}x0���Y��Aq�X�i�E)�`��T�Yg�Y��o���̟����<�r�?k�����Y��}��1q��d��#��_Iwi*M��L�#e��7Dt?m0W���q��>����ݦFq�՜,��`H*)3vvPj*�e*��ջ�r��-(�ŧq3���lmu��6���q�L��5!7��ⶄ�w1�]h��8���������?J+�            x������ � �     