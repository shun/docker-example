<template>
  <v-container>
    <v-row>
      kudo
    </v-row>
    <label @click="play">play</label>
    <label @click="init" style="background-color: red;">init</label>
  </v-container>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import * as Mqtt from 'mqtt';
import { Howl, Howler } from 'howler';
import sound_file_1 from '../tea_time.mp3';
import sound_file_2 from '../daisougen.mp3';
import sound_file_all from '../output.mp3';

@Component
export default class HelloWorld extends Vue {
  private i: number;
  private b: boolean;
  private play_sts_playing: number;
  private client!: Mqtt.MqttClient;
  private ctx;
  private audiosrc;
  private audio;
  private audioid1;
  private audioid2;
  private done;

  private sound;

  private constructor() {
    super();
    this.client = Mqtt.connect('ws://192.168.1.141:9090');
    this.i = 1;
    this.b = true;
    this.play_sts_playing = -1;
    this.done = -1;
    this.sound = new Howl({
      src: [sound_file_all],
      sprite: {
        audio1: [0, 180000],
        audio2: [180000, 189000],
      },
      onplay: (id) => {
        console.log("play: " + id);
      },
      onend: () => {
        console.log("end");
      },
      onload: () => {
        console.log("load");
      }
    });
  }

  private pub() {
    this.client.publish('/test', 'Hello MQTT');
  }

  private init() {
    console.log("init");
    this.ctx = new(window.AudioContext || window.webkitAudioContext);
    this.audiosrc = ctx.createBufferSouce();
  }
  private play() {
    console.log("clicked play");
    this.b = true;

    this.sound = new Howl({
      src: [sound_file_all],
      sprite: {
        audio1: [0, 180000],
        audio2: [180000, 189000],
      },
      onplay: (id) => {
        console.log("play: " + id);
      },
      onend: () => {
        console.log("end");
      },
      onload: () => {
        console.log("load");
      }
    });
  }
  private mounted() {
    console.log('kudo');
    this.client.on('connect', () => {
      this.client.subscribe('/test');
    });
    setInterval(this.pub, 10000);

    this.client.on('message', (topic: string, payload: Buffer) => {
      console.log("subscribe:");
      console.log({topic});
      if (this.b) {
        //console.log(this.sound);
        //this.sound.src = '../tea_time' + this.i + '.mp3';
        //this.i += 1;
        //console.log(this.sound);
        if (this.play_sts_playing < 0) {
          console.log("play 1");
          //console.log(this.sound);
          //this.audioid1=this.sound.play();
          //this.sound.stop(this.audioid1);
          //console.log(this.audioid1);
          //this.audioid2=this.sound.play();
          //console.log(this.audioid2);
          this.play_sts_playing = 1;
          this.done = 0;
        }
        else if (this.play_sts_playing == 1) {
          console.log("play 2");
          this.sound.play('audio1');
          this.play_sts_playing = 2;
        }
        //this.audio.play();
      }
    });
  }
}
</script>
