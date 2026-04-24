class BulletFilter
{
public:
CBaseEntity* hTarget, *hSelf;

virtual bool ShouldHitEntity(CBaseEntity* E, int)
{
if (E == hTarget || E == hSelf)
return 0;

if (ClientClass* cl = E->GetClientClass())
{
const char* cclass = cl->m_pNetworkName;

if (tf2() && (
!strcmp(cclass, "CTFReviveMarker") ||
!strcmp(cclass, "CTFMedigunShield") ||
!strcmp(cclass, "CFuncRespawnRoomVisualizer")
)
)
return 0;

if (dod() && !strcmp(cclass, "CFuncNewTeamWall"))
return 0;

if (MENU_AIMGLASS && !strcmp(cclass, "CBreakableSurface"))
return 0;
}

return 1;
}

virtual int GetTraceType() const
{
return 0;
}
};

int aimbot::GetAimBone(CBaseEntity* e)
{
int bone = 0;
for (int i = 0; i < e->Hitboxes(); i++)
{
mstudiobbox* box = e->GetHitbox(i);

if (!box)
continue;

if (box->group != (MENU_AIMBSPOT == 0 ? HITGROUP_HEAD : (MENU_AIMBSPOT == 1 ? HITGROUP_CHEST : HITGROUP_STOMACH)))
continue;

bone = i;
}

return bone;
}
int real_flags = 0, next_flags = 0;
