CameraFollow = Class("CameraFollow")

CameraFollow.Ctor = function (self, target)
    self.target = target
    self.offset = Camera.main.transform.position - target.player.transform.position
    if not self.handle then
        self.handle = LateUpdateBeat:CreateListener(self.LateUpdate, self)
    end
    LateUpdateBeat:AddListener(self.handle)
end

CameraFollow.LateUpdate = function (self)
    Camera.main.transform.position = self.target.player.transform.position + self.offset
end