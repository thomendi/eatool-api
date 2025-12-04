--
-- PostgreSQL database dump
--

\restrict 4d5LV2QK4fRDDDPyVxHtimzm5K3feAJpS44gf7LXadPgbRKZ7CqMapwzfCRiMsm

-- Dumped from database version 13.23
-- Dumped by pg_dump version 16.11 (Debian 16.11-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: devuser
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO devuser;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO devuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO devuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO devuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO devuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO devuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO devuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO devuser;

--
-- Name: core_artefacts; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.core_artefacts (
    id character varying(10) NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    type character varying(255) NOT NULL,
    level integer NOT NULL,
    subtype character varying(255) NOT NULL,
    alias character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    subcategory character varying(255) NOT NULL,
    version character varying(10) NOT NULL,
    company character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    state character varying(100) NOT NULL,
    objetive character varying(255) NOT NULL,
    range character varying(255) NOT NULL
);


ALTER TABLE public.core_artefacts OWNER TO devuser;

--
-- Name: core_diagrams; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.core_diagrams (
    id integer NOT NULL,
    idart character varying(20) NOT NULL,
    name character varying(255) NOT NULL,
    diagram text NOT NULL,
    version character varying(10) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.core_diagrams OWNER TO devuser;

--
-- Name: core_diagrams_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.core_diagrams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_diagrams_id_seq OWNER TO devuser;

--
-- Name: core_diagrams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.core_diagrams_id_seq OWNED BY public.core_diagrams.id;


--
-- Name: core_user; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.core_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL
);


ALTER TABLE public.core_user OWNER TO devuser;

--
-- Name: core_user_groups; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.core_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.core_user_groups OWNER TO devuser;

--
-- Name: core_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.core_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_user_groups_id_seq OWNER TO devuser;

--
-- Name: core_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.core_user_groups_id_seq OWNED BY public.core_user_groups.id;


--
-- Name: core_user_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.core_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_user_id_seq OWNER TO devuser;

--
-- Name: core_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.core_user_id_seq OWNED BY public.core_user.id;


--
-- Name: core_user_user_permissions; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.core_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.core_user_user_permissions OWNER TO devuser;

--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.core_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.core_user_user_permissions_id_seq OWNER TO devuser;

--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.core_user_user_permissions_id_seq OWNED BY public.core_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO devuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO devuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO devuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO devuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO devuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO devuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO devuser;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: core_diagrams id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_diagrams ALTER COLUMN id SET DEFAULT nextval('public.core_diagrams_id_seq'::regclass);


--
-- Name: core_user id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user ALTER COLUMN id SET DEFAULT nextval('public.core_user_id_seq'::regclass);


--
-- Name: core_user_groups id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_groups ALTER COLUMN id SET DEFAULT nextval('public.core_user_groups_id_seq'::regclass);


--
-- Name: core_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.core_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add artefacts	9	add_artefacts
34	Can change artefacts	9	change_artefacts
35	Can delete artefacts	9	delete_artefacts
36	Can view artefacts	9	view_artefacts
37	Can add diagrams	10	add_diagrams
38	Can change diagrams	10	change_diagrams
39	Can delete diagrams	10	delete_diagrams
40	Can view diagrams	10	view_diagrams
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
96380a8c228da69209f9809536396d169d50c234	2025-10-31 03:43:48.352254+00	4
d45cf7bc672911b8a655531320cf4ed63f5dc529	2025-11-15 03:00:25.222952+00	2
\.


--
-- Data for Name: core_artefacts; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.core_artefacts (id, name, description, type, level, subtype, alias, category, subcategory, version, company, owner, state, objetive, range) FROM stdin;
PROC-0001	Proceso de Gestion	Proceso para gestionar pedidos	BPMN	3	Proceso	Gestion	Administracion	Gestion	V1	IPS	Beneficios	Activo	Resolver las solicitudes	incio solicitud
PROC-0002	Generico	Proceso Base	BPMN	3	EPC				V2	SPS		ACTIVE	NINGUNA	
PROC-4322	Proceso de Mantencion	Proceso que gestiona en forma masivo el benefiio de la PGU	BPMN	2	Proceso	Alias test	Operaciones	General	1.0	Mi empresa	Tomas Mendicoa	Activo	Optimizar	Corporativo
\.


--
-- Data for Name: core_diagrams; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.core_diagrams (id, idart, name, diagram, version, description) FROM stdin;
1	PROC-0002	Diagrama Basico II	<?xml version='1.0' encoding='UTF-8'?><bpmn:definitions xmlns:bpmn='http://www.omg.org/spec/BPMN/20100524/MODEL' xmlns:bpmndi='http://www.omg.org/spec/BPMN/20100524/DI' xmlns:dc='http://www.omg.org/spec/DD/20100524/DC' xmlns:di='http://www.omg.org/spec/DD/20100524/DI' id='Definitions_1' targetNamespace='http://bpmn.io/schema/bpmn'><bpmn:process id='Process_1' isExecutable='false'><bpmn:startEvent id='StartEvent_1'/></bpmn:process><bpmndi:BPMNDiagram id='BPMNDiagram_1'><bpmndi:BPMNPlane id='BPMNPlane_1' bpmnElement='Process_1'><bpmndi:BPMNShape id='StartEvent_1_di' bpmnElement='StartEvent_1'><dc:Bounds x='150' y='150' width='36' height='36' /></bpmndi:BPMNShape></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></bpmn:definitions>	V2.0	Diagrama Generico que permite probar la solución
2	PROC-4322	Proceso de Mantencion	<?xml version="1.0" encoding="UTF-8"?>\n<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" targetNamespace="http://bpmn.io/schema/bpmn">\n  <process id="Process_1" isExecutable="false">\n    <startEvent id="StartEvent_1">\n      <outgoing>Flow_026d313</outgoing>\n    </startEvent>\n    <task id="Activity_0gjp8wr" name="Ingresa por Atencion Cliente">\n      <incoming>Flow_026d313</incoming>\n      <outgoing>Flow_1xwz2nz</outgoing>\n    </task>\n    <sequenceFlow id="Flow_026d313" sourceRef="StartEvent_1" targetRef="Activity_0gjp8wr" />\n    <sequenceFlow id="Flow_1xwz2nz" sourceRef="Activity_0gjp8wr" targetRef="Gateway_1m865uw" />\n    <exclusiveGateway id="Gateway_1m865uw">\n      <incoming>Flow_1xwz2nz</incoming>\n      <outgoing>Flow_0ksj1p5</outgoing>\n      <outgoing>Flow_0dfam6x</outgoing>\n      <outgoing>Flow_011e9dz</outgoing>\n      <outgoing>Flow_0j2mpft</outgoing>\n    </exclusiveGateway>\n    <task id="Activity_1hwqgx3" name="Solicitud de Beneficio">\n      <incoming>Flow_0ksj1p5</incoming>\n      <outgoing>Flow_1cybh6g</outgoing>\n    </task>\n    <sequenceFlow id="Flow_0ksj1p5" sourceRef="Gateway_1m865uw" targetRef="Activity_1hwqgx3" />\n    <task id="Activity_0k0jztk" name="Cancelar Suspencion">\n      <incoming>Flow_0dfam6x</incoming>\n    </task>\n    <sequenceFlow id="Flow_0dfam6x" sourceRef="Gateway_1m865uw" targetRef="Activity_0k0jztk" />\n    <task id="Activity_042c2q1" name="Solicitar pago">\n      <incoming>Flow_011e9dz</incoming>\n    </task>\n    <sequenceFlow id="Flow_011e9dz" sourceRef="Gateway_1m865uw" targetRef="Activity_042c2q1" />\n    <task id="Activity_0oppfp1" name="Renunciar al Beneficio">\n      <incoming>Flow_0j2mpft</incoming>\n    </task>\n    <sequenceFlow id="Flow_0j2mpft" sourceRef="Gateway_1m865uw" targetRef="Activity_0oppfp1" />\n    <task id="Activity_0z7hzm2" name="analisis de residencia">\n      <incoming>Flow_1cybh6g</incoming>\n      <outgoing>Flow_0geocpo</outgoing>\n    </task>\n    <sequenceFlow id="Flow_1cybh6g" sourceRef="Activity_1hwqgx3" targetRef="Activity_0z7hzm2" />\n    <exclusiveGateway id="Gateway_13aed7t">\n      <incoming>Flow_0geocpo</incoming>\n      <outgoing>Flow_0i04jwt</outgoing>\n      <outgoing>Flow_1lqeycq</outgoing>\n    </exclusiveGateway>\n    <sequenceFlow id="Flow_0geocpo" sourceRef="Activity_0z7hzm2" targetRef="Gateway_13aed7t" />\n    <task id="Activity_0dgt976">\n      <incoming>Flow_0i04jwt</incoming>\n    </task>\n    <sequenceFlow id="Flow_0i04jwt" name="Aprobar" sourceRef="Gateway_13aed7t" targetRef="Activity_0dgt976" />\n    <endEvent id="Event_0rkytpl">\n      <incoming>Flow_1lqeycq</incoming>\n    </endEvent>\n    <sequenceFlow id="Flow_1lqeycq" name="Rechazar" sourceRef="Gateway_13aed7t" targetRef="Event_0rkytpl" />\n  </process>\n  <bpmndi:BPMNDiagram id="BPMNDiagram_1">\n    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_1">\n      <bpmndi:BPMNShape id="StartEvent_1_di" bpmnElement="StartEvent_1">\n        <dc:Bounds x="150" y="150" width="36" height="36" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_0gjp8wr_di" bpmnElement="Activity_0gjp8wr">\n        <dc:Bounds x="240" y="128" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Gateway_1c2cjli_di" bpmnElement="Gateway_1m865uw" isMarkerVisible="true">\n        <dc:Bounds x="395" y="143" width="50" height="50" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_1hwqgx3_di" bpmnElement="Activity_1hwqgx3">\n        <dc:Bounds x="500" y="128" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_0k0jztk_di" bpmnElement="Activity_0k0jztk">\n        <dc:Bounds x="500" y="240" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_042c2q1_di" bpmnElement="Activity_042c2q1">\n        <dc:Bounds x="500" y="350" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_0oppfp1_di" bpmnElement="Activity_0oppfp1">\n        <dc:Bounds x="500" y="460" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_0z7hzm2_di" bpmnElement="Activity_0z7hzm2">\n        <dc:Bounds x="660" y="128" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Gateway_13aed7t_di" bpmnElement="Gateway_13aed7t" isMarkerVisible="true">\n        <dc:Bounds x="825" y="143" width="50" height="50" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_0dgt976_di" bpmnElement="Activity_0dgt976">\n        <dc:Bounds x="940" y="128" width="100" height="80" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Event_0rkytpl_di" bpmnElement="Event_0rkytpl">\n        <dc:Bounds x="832" y="52" width="36" height="36" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id="Flow_026d313_di" bpmnElement="Flow_026d313">\n        <di:waypoint x="186" y="168" />\n        <di:waypoint x="240" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_1xwz2nz_di" bpmnElement="Flow_1xwz2nz">\n        <di:waypoint x="340" y="168" />\n        <di:waypoint x="395" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0ksj1p5_di" bpmnElement="Flow_0ksj1p5">\n        <di:waypoint x="445" y="168" />\n        <di:waypoint x="500" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0dfam6x_di" bpmnElement="Flow_0dfam6x">\n        <di:waypoint x="420" y="193" />\n        <di:waypoint x="420" y="280" />\n        <di:waypoint x="500" y="280" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_011e9dz_di" bpmnElement="Flow_011e9dz">\n        <di:waypoint x="420" y="193" />\n        <di:waypoint x="420" y="390" />\n        <di:waypoint x="500" y="390" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0j2mpft_di" bpmnElement="Flow_0j2mpft">\n        <di:waypoint x="420" y="193" />\n        <di:waypoint x="420" y="500" />\n        <di:waypoint x="500" y="500" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_1cybh6g_di" bpmnElement="Flow_1cybh6g">\n        <di:waypoint x="600" y="168" />\n        <di:waypoint x="660" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0geocpo_di" bpmnElement="Flow_0geocpo">\n        <di:waypoint x="760" y="168" />\n        <di:waypoint x="825" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0i04jwt_di" bpmnElement="Flow_0i04jwt">\n        <di:waypoint x="875" y="168" />\n        <di:waypoint x="940" y="168" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x="888" y="150" width="40" height="14" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_1lqeycq_di" bpmnElement="Flow_1lqeycq">\n        <di:waypoint x="850" y="143" />\n        <di:waypoint x="850" y="88" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x="856" y="113" width="48" height="14" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>	1.0	Guardado desde editor
3	PROC-5913	tommy	<?xml version="1.0" encoding="UTF-8"?>\n<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" targetNamespace="http://bpmn.io/schema/bpmn">\n  <process id="Process_1" isExecutable="false">\n    <startEvent id="StartEvent_1">\n      <outgoing>Flow_0b2qyrt</outgoing>\n    </startEvent>\n    <task id="Activity_09t7yvx" name="as">\n      <incoming>Flow_0b2qyrt</incoming>\n      <outgoing>Flow_1e8pui9</outgoing>\n    </task>\n    <sequenceFlow id="Flow_0b2qyrt" sourceRef="StartEvent_1" targetRef="Activity_09t7yvx" />\n    <exclusiveGateway id="Gateway_15gbfbk">\n      <incoming>Flow_1e8pui9</incoming>\n      <outgoing>Flow_18fp2pe</outgoing>\n      <outgoing>Flow_06e5qaf</outgoing>\n    </exclusiveGateway>\n    <sequenceFlow id="Flow_1e8pui9" sourceRef="Activity_09t7yvx" targetRef="Gateway_15gbfbk" />\n    <task id="Activity_012xdkw" name="ed">\n      <incoming>Flow_18fp2pe</incoming>\n    </task>\n    <sequenceFlow id="Flow_18fp2pe" sourceRef="Gateway_15gbfbk" targetRef="Activity_012xdkw" />\n    <task id="Activity_0wb6vrs">\n      <incoming>Flow_06e5qaf</incoming>\n    </task>\n    <sequenceFlow id="Flow_06e5qaf" sourceRef="Gateway_15gbfbk" targetRef="Activity_0wb6vrs" />\n  </process>\n  <bpmndi:BPMNDiagram id="BPMNDiagram_1">\n    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_1">\n      <bpmndi:BPMNShape id="StartEvent_1_di" bpmnElement="StartEvent_1">\n        <dc:Bounds x="150" y="150" width="36" height="36" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_09t7yvx_di" bpmnElement="Activity_09t7yvx">\n        <dc:Bounds x="240" y="128" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Gateway_15gbfbk_di" bpmnElement="Gateway_15gbfbk" isMarkerVisible="true">\n        <dc:Bounds x="395" y="143" width="50" height="50" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_012xdkw_di" bpmnElement="Activity_012xdkw">\n        <dc:Bounds x="500" y="128" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_0wb6vrs_di" bpmnElement="Activity_0wb6vrs">\n        <dc:Bounds x="500" y="240" width="100" height="80" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id="Flow_0b2qyrt_di" bpmnElement="Flow_0b2qyrt">\n        <di:waypoint x="186" y="168" />\n        <di:waypoint x="240" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_1e8pui9_di" bpmnElement="Flow_1e8pui9">\n        <di:waypoint x="340" y="168" />\n        <di:waypoint x="395" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_18fp2pe_di" bpmnElement="Flow_18fp2pe">\n        <di:waypoint x="445" y="168" />\n        <di:waypoint x="500" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_06e5qaf_di" bpmnElement="Flow_06e5qaf">\n        <di:waypoint x="420" y="193" />\n        <di:waypoint x="420" y="280" />\n        <di:waypoint x="500" y="280" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>	1.0	Guardado desde editor
4	PROC-2289	Tareas de Tommy	<?xml version="1.0" encoding="UTF-8"?>\n<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" targetNamespace="http://bpmn.io/schema/bpmn">\n  <process id="Process_1" isExecutable="false">\n    <startEvent id="StartEvent_1">\n      <outgoing>Flow_0qoaei3</outgoing>\n    </startEvent>\n    <exclusiveGateway id="Gateway_129gr8c">\n      <incoming>Flow_0qoaei3</incoming>\n      <outgoing>Flow_0h595xs</outgoing>\n      <outgoing>Flow_0b3msib</outgoing>\n    </exclusiveGateway>\n    <sequenceFlow id="Flow_0qoaei3" sourceRef="StartEvent_1" targetRef="Gateway_129gr8c" />\n    <task id="Activity_0c9tqnr" name="Ajustar pagina de datos">\n      <incoming>Flow_0h595xs</incoming>\n      <outgoing>Flow_0zzae0w</outgoing>\n    </task>\n    <sequenceFlow id="Flow_0h595xs" sourceRef="Gateway_129gr8c" targetRef="Activity_0c9tqnr" />\n    <sequenceFlow id="Flow_0b3msib" sourceRef="Gateway_129gr8c" targetRef="Event_1uwwxa6" />\n    <intermediateCatchEvent id="Event_1uwwxa6">\n      <incoming>Flow_0b3msib</incoming>\n      <timerEventDefinition id="TimerEventDefinition_0z0chtm" />\n    </intermediateCatchEvent>\n    <task id="Activity_0gc8t36" name="Incorporar persistencia">\n      <incoming>Flow_0zzae0w</incoming>\n      <outgoing>Flow_0iitnux</outgoing>\n    </task>\n    <sequenceFlow id="Flow_0zzae0w" sourceRef="Activity_0c9tqnr" targetRef="Activity_0gc8t36" />\n    <endEvent id="Event_11mbvqy">\n      <incoming>Flow_0iitnux</incoming>\n    </endEvent>\n    <sequenceFlow id="Flow_0iitnux" sourceRef="Activity_0gc8t36" targetRef="Event_11mbvqy" />\n  </process>\n  <bpmndi:BPMNDiagram id="BPMNDiagram_1">\n    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_1">\n      <bpmndi:BPMNShape id="StartEvent_1_di" bpmnElement="StartEvent_1">\n        <dc:Bounds x="150" y="150" width="36" height="36" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Gateway_129gr8c_di" bpmnElement="Gateway_129gr8c" isMarkerVisible="true">\n        <dc:Bounds x="245" y="143" width="50" height="50" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_0c9tqnr_di" bpmnElement="Activity_0c9tqnr">\n        <dc:Bounds x="360" y="128" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Event_1xuvfco_di" bpmnElement="Event_1uwwxa6">\n        <dc:Bounds x="252" y="62" width="36" height="36" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Activity_0gc8t36_di" bpmnElement="Activity_0gc8t36">\n        <dc:Bounds x="530" y="128" width="100" height="80" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id="Event_11mbvqy_di" bpmnElement="Event_11mbvqy">\n        <dc:Bounds x="702" y="150" width="36" height="36" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id="Flow_0qoaei3_di" bpmnElement="Flow_0qoaei3">\n        <di:waypoint x="186" y="168" />\n        <di:waypoint x="245" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0h595xs_di" bpmnElement="Flow_0h595xs">\n        <di:waypoint x="295" y="168" />\n        <di:waypoint x="360" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0b3msib_di" bpmnElement="Flow_0b3msib">\n        <di:waypoint x="270" y="143" />\n        <di:waypoint x="270" y="98" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0zzae0w_di" bpmnElement="Flow_0zzae0w">\n        <di:waypoint x="460" y="168" />\n        <di:waypoint x="530" y="168" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id="Flow_0iitnux_di" bpmnElement="Flow_0iitnux">\n        <di:waypoint x="630" y="168" />\n        <di:waypoint x="702" y="168" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>	1.0	Guardado desde editor
\.


--
-- Data for Name: core_user; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.core_user (id, password, last_login, is_superuser, email, name, is_active, is_staff) FROM stdin;
1	pbkdf2_sha256$260000$j45LGUHqcauHL3P0JAeDXR$JVe0wOq6aI5wv//yp/O/kdxq0xxpc2KKrTUfb8jXuzU=	\N	f	test@example.com		t	f
2	pbkdf2_sha256$260000$zkLqfQa82IEdNhbmCZuvq3$Y/4YVkSrZQxTSH4irU43kbayTfIHnmOi5YydHy1u35I=	2025-10-28 01:59:32.452862+00	t	admin@example.com		t	t
3	pbkdf2_sha256$260000$W2RUVDPfIwWh09GPTpiZCP$clGbYAmoiFHfy+WDmBDbJGHtFP8F5V+AY3T/O+PPvrk=	2025-10-28 01:59:10.039899+00	t	tmendicoa@gmail.com	Tomas	t	t
4	pbkdf2_sha256$260000$acao7MgIx1rGGVoEiatukR$80XREpLpyWLgBFDD2NRIdMMbnvA7qOawL6zHcqu14U8=	\N	f	user2@example.com	User Two	t	f
\.


--
-- Data for Name: core_user_groups; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.core_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: core_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.core_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-10-28 01:01:19.255512+00	1	test@example.com	2	[{"changed": {"fields": ["Is staff"]}}]	6	2
2	2025-10-28 01:01:37.69822+00	1	test@example.com	2	[{"changed": {"fields": ["Is staff"]}}]	6	2
3	2025-10-28 01:57:35.049713+00	3	tmendicoa@gmail.com	1	[{"added": {}}]	6	2
4	2025-10-28 01:58:33.795455+00	3	tmendicoa@gmail.com	2	[{"changed": {"fields": ["Is staff", "Superuser status"]}}]	6	3
5	2025-10-28 01:58:55.25998+00	3	tmendicoa@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	6	2
6	2025-10-28 01:59:46.739315+00	3	tmendicoa@gmail.com	2	[{"changed": {"fields": ["Superuser status"]}}]	6	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	core	user
7	authtoken	token
8	authtoken	tokenproxy
9	core	artefacts
10	core	diagrams
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-10-27 12:55:39.23735+00
2	contenttypes	0002_remove_content_type_name	2025-10-27 12:55:39.240731+00
3	auth	0001_initial	2025-10-27 12:55:39.257345+00
4	auth	0002_alter_permission_name_max_length	2025-10-27 12:55:39.25961+00
5	auth	0003_alter_user_email_max_length	2025-10-27 12:55:39.261839+00
6	auth	0004_alter_user_username_opts	2025-10-27 12:55:39.263966+00
7	auth	0005_alter_user_last_login_null	2025-10-27 12:55:39.266037+00
8	auth	0006_require_contenttypes_0002	2025-10-27 12:55:39.266785+00
9	auth	0007_alter_validators_add_error_messages	2025-10-27 12:55:39.268945+00
10	auth	0008_alter_user_username_max_length	2025-10-27 12:55:39.272242+00
11	auth	0009_alter_user_last_name_max_length	2025-10-27 12:55:39.276466+00
12	auth	0010_alter_group_name_max_length	2025-10-27 12:55:39.286946+00
13	auth	0011_update_proxy_permissions	2025-10-27 12:55:39.291371+00
14	auth	0012_alter_user_first_name_max_length	2025-10-27 12:55:39.293784+00
15	core	0001_initial	2025-10-27 12:55:39.311139+00
16	admin	0001_initial	2025-10-27 12:55:39.320112+00
17	admin	0002_logentry_remove_auto_add	2025-10-27 12:55:39.323317+00
18	admin	0003_logentry_add_action_flag_choices	2025-10-27 12:55:39.326244+00
19	sessions	0001_initial	2025-10-27 12:55:39.331269+00
20	authtoken	0001_initial	2025-10-31 03:31:21.478916+00
21	authtoken	0002_auto_20160226_1747	2025-10-31 03:31:21.490153+00
22	authtoken	0003_tokenproxy	2025-10-31 03:31:21.491367+00
23	core	0002_artefacts_diagrams	2025-11-12 01:16:23.041051+00
24	core	0003_diagrams_version	2025-11-15 15:03:40.014298+00
25	core	0004_diagrams_description	2025-11-15 15:03:40.017409+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2jksafdxmn6957tlf5o2zd3j0rih7u4l	.eJxVjEEOwiAQRe_C2pCBgkxduvcMZDoDUjU0Ke3KeHfbpAvd_vfef6tI61Li2tIcR1EXZdXpdxuIn6nuQB5U75PmqS7zOOhd0Qdt-jZJel0P9--gUCtb7R1hYMC-k2yzDQGAgM9sjPPsjWUrAX3HIYMFQIRMskHC3qBLlNTnC8FCNy8:1vDYzk:hNcT74C-E0iWpK_MatB6iDd3V8bxgKQG9AaCNP944Ks	2025-11-11 01:59:32.453838+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: core_diagrams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.core_diagrams_id_seq', 4, true);


--
-- Name: core_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.core_user_groups_id_seq', 1, false);


--
-- Name: core_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.core_user_id_seq', 4, true);


--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.core_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 6, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 56, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: core_artefacts core_artefacts_name_key; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_artefacts
    ADD CONSTRAINT core_artefacts_name_key UNIQUE (name);


--
-- Name: core_artefacts core_artefacts_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_artefacts
    ADD CONSTRAINT core_artefacts_pkey PRIMARY KEY (id);


--
-- Name: core_diagrams core_diagrams_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_diagrams
    ADD CONSTRAINT core_diagrams_pkey PRIMARY KEY (id);


--
-- Name: core_user core_user_email_key; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_email_key UNIQUE (email);


--
-- Name: core_user_groups core_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_pkey PRIMARY KEY (id);


--
-- Name: core_user_groups core_user_groups_user_id_group_id_c82fcad1_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_user_id_group_id_c82fcad1_uniq UNIQUE (user_id, group_id);


--
-- Name: core_user core_user_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_pkey PRIMARY KEY (id);


--
-- Name: core_user_user_permissions core_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: core_user_user_permissions core_user_user_permissions_user_id_permission_id_73ea0daa_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_user_id_permission_id_73ea0daa_uniq UNIQUE (user_id, permission_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: core_artefacts_id_f3e74a89_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX core_artefacts_id_f3e74a89_like ON public.core_artefacts USING btree (id varchar_pattern_ops);


--
-- Name: core_artefacts_name_270b79c7_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX core_artefacts_name_270b79c7_like ON public.core_artefacts USING btree (name varchar_pattern_ops);


--
-- Name: core_user_email_92a71487_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX core_user_email_92a71487_like ON public.core_user USING btree (email varchar_pattern_ops);


--
-- Name: core_user_groups_group_id_fe8c697f; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX core_user_groups_group_id_fe8c697f ON public.core_user_groups USING btree (group_id);


--
-- Name: core_user_groups_user_id_70b4d9b8; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX core_user_groups_user_id_70b4d9b8 ON public.core_user_groups USING btree (user_id);


--
-- Name: core_user_user_permissions_permission_id_35ccf601; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX core_user_user_permissions_permission_id_35ccf601 ON public.core_user_user_permissions USING btree (permission_id);


--
-- Name: core_user_user_permissions_user_id_085123d3; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX core_user_user_permissions_user_id_085123d3 ON public.core_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_groups core_user_groups_group_id_fe8c697f_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_group_id_fe8c697f_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_groups core_user_groups_user_id_70b4d9b8_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_user_id_70b4d9b8_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_user_permissions core_user_user_permi_permission_id_35ccf601_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permi_permission_id_35ccf601_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_user_permissions core_user_user_permissions_user_id_085123d3_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_user_id_085123d3_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: devuser
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict 4d5LV2QK4fRDDDPyVxHtimzm5K3feAJpS44gf7LXadPgbRKZ7CqMapwzfCRiMsm

