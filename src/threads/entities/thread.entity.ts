import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type ThreadDocument = Thread & Document;

export type ThreadProps = {
  content: string;
  screen_name: string;
};

@Schema()
export class Thread {
  constructor(props: ThreadProps) {
    Object.assign(this, props);
  }

  @Prop({ required: true })
  content: string;

  @Prop({ required: true })
  screen_name: string;
}

export const ThreadSchema = SchemaFactory.createForClass(Thread);
