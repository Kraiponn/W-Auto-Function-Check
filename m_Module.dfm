object Module: TModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 366
  Width = 535
  object Com: TApdComPort
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 48
    Top = 40
  end
  object packetDa: TApdDataPacket
    Enabled = True
    EndCond = [ecString]
    StartString = 'b'
    EndString = 'a'
    ComPort = Com
    PacketSize = 0
    OnStringPacket = packetDaStringPacket
    Left = 56
    Top = 104
  end
  object Packet2: TApdDataPacket
    Enabled = True
    EndCond = [ecString]
    StartString = 'b'
    EndString = 'a'
    ComPort = Com
    PacketSize = 0
    Left = 144
    Top = 104
  end
  object ApdDataPacket3: TApdDataPacket
    Enabled = True
    EndCond = [ecString]
    StartString = 'b'
    EndString = 'a'
    ComPort = Com
    PacketSize = 0
    Left = 56
    Top = 176
  end
end
