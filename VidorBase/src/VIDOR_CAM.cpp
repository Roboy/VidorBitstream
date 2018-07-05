#include "VIDOR_CAM.h"

Vidor_CAM::Vidor_CAM(){
}

int Vidor_CAM::begin () {
  int ret;
  ret= WireEx.begin();
  vgfx.fillRect(0, 0, 640, 480,0,0);
  return ret;

}

int Vidor_CAM::setPower(bool on) {
  int ret = 0;
  if (on) {
    ret = sensor_init();
  } else {
    ret = set_sw_standby(1);
  }
  return ret;
}

int Vidor_CAM::enableStream() {
  int ret;
  ret = write(CAM_ADDR, 0x4202, 0x00);
  if (ret < 0) {
    return ret;
  }
  return write(CAM_ADDR, 0x300D, 0x00);
}

int Vidor_CAM::disableStream(){
  int ret;
  ret = write(CAM_ADDR, 0x4202, 0x0f);
  if (ret < 0) {
    return ret;
  }
  return write(CAM_ADDR, 0x300D, 0x01);
}

int Vidor_CAM::modelDetect(void) {
  unsigned char readel;
  int ret;
  ret = write(CAM_ADDR, CAM_SW_RESET, 0x01);
  if (ret < 0) {
    return ret;
  }
  ret = read(CAM_ADDR, CAM_REG_CHIPID_H, &readel, 1);
  if (ret < 0) {
    return ret;
  }
  if (readel != 0x56) {
    return -1;
  }
  ret = read(CAM_ADDR, CAM_REG_CHIPID_L, &readel, 1);
  if (ret < 0) {
    return ret;
  }
  if (readel != 0x47) {
    return -1;
  }
  return write(CAM_ADDR, CAM_SW_RESET, 0x00);
}

int Vidor_CAM::write(uint8_t address, uint16_t reg, uint8_t data) {
  int ret;
  WireEx.beginTransmission(address);

  ret=WireEx.write((uint8_t)(reg>>8));
  if(ret<=0){
  	  return -1;
  }
  ret=WireEx.write((uint8_t)(reg));
  if(ret<=0){
  	  return -1;
  }
  ret=WireEx.write(data);
  if(ret<=0){
  	  return -1;
  }
  WireEx.endTransmission();
  return ret;
}

int Vidor_CAM::read(uint8_t address, uint16_t reg, uint8_t* data, uint8_t len) {
  int ret;
  WireEx.beginTransmission(address);
  WireEx.write((uint8_t)(reg>>8));
  WireEx.write((uint8_t)(reg));
  WireEx.endTransmission();
  WireEx.requestFrom(address, len);
  if (len <= WireEx.available()) {
    int i;
    for (i=0; i<len; i++) {
      data[i] = WireEx.read();
    }
    return len;
  }
  return 0;
}

int Vidor_CAM::sensor_init(void) {
  int ret;
  unsigned char resetval, rdval;
  ret = read(CAM_ADDR, 0x0100, &rdval, 1);
  if (ret <0) {
    return ret;
  }
  ret = write_array(cam_640x480, (sizeof(cam_640x480) / sizeof(struct regval_list)));
  if (ret < 0) {
    return ret;
  }
  ret = set_virtual_channel( 0);
  if (ret < 0) {
    return ret;
  }
  ret = read(CAM_ADDR, 0x0100, &resetval, 1);
  if (ret < 0) {
    return ret;
  }
  if (!(resetval & 0x01)) {
    ret = write(CAM_ADDR, 0x0100, 0x01);
    if (ret < 0) {
      return ret;
    }
  }
  return write(CAM_ADDR, 0x4800, 0x04);
}

int Vidor_CAM::write_array(struct regval_list *regs, int array_size) {
  int i, ret;

  for (i = 0; i < array_size; i++) {
    ret = write(CAM_ADDR, regs[i].addr, regs[i].data);
    if (ret < 0) {
      return ret;
    }
  }
  return 0;
}


int Vidor_CAM::set_sw_standby(int standby) {
  int ret;
  unsigned char rdval;

  ret = read(CAM_ADDR, 0x0100, &rdval, 1);
  if (ret < 0) {
    return ret;
  }
  if (standby) {
    rdval &= ~0x01;
  } else {
    rdval |= 0x01;
  }
  return write(CAM_ADDR, 0x0100, rdval);
}

int Vidor_CAM::set_virtual_channel(int channel) {
  unsigned char channel_id;
  int ret;
  ret = read(CAM_ADDR, 0x4814, &channel_id, 1);
  if (ret < 0) {
    return ret;
  }
  channel_id &= ~(3 << 6);
  return write(CAM_ADDR, 0x4814, channel_id | (channel << 6));
}
