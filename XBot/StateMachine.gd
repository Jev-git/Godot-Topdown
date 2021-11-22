extends Node
class_name StateMachine

export var m_nInitialStatePath = NodePath()
onready var m_nState: State = get_node(m_nInitialStatePath)

onready var m_nParentNode: Node = get_parent()
onready var m_nAnimPlayer: AnimationPlayer = m_nParentNode.get_node("RootNode/AnimationPlayer")

func _init():
	add_to_group("StateMachine")

func _ready():
	m_nParentNode.connect("get_hit", self, "_on_parent_get_hit")
	m_nState.enter_state()

func _process(delta):
	m_nState.process(delta)

func _physics_process(delta):
	m_nState.physics_process(delta)

func _on_parent_get_hit(_nOtherNode: Node):
	m_nState.get_hit(_nOtherNode)

func change_state(_sStatePath: String):
	if !has_node(_sStatePath):
		return
	
	var nNewState: State = get_node(_sStatePath)
	if nNewState.m_bIsAvailable:
		m_nState.exit_state()
		m_nState = nNewState
		m_nState.enter_state()
