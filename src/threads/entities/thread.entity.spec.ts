import mongoose from 'mongoose';
import { Thread, ThreadSchema } from './thread.entity';

describe('thread Tests', () => {
  //Teste de unidade
  describe('thread Class', () => {
    it('should create a thread', () => {
      const thread = new Thread({
        content: 'Hello World',
        screen_name: 'Fernando Britto',
      });

      expect(thread.content).toBe('Hello World');
      expect(thread.screen_name).toBe('Fernando Britto');
    });
  });

  //teste de integração - menos rapido e mais custoso que unitario
  describe('Using MongoDB', () => {
    let conn: mongoose.Mongoose;

    beforeEach(async () => {
      conn = await mongoose.connect(
        `mongodb://root:root@db_prod:27017/tweets_entity_test?authSource=admin`,
      );
    });

    afterEach(async () => {
      await conn.disconnect();
    });

    it('create a thread document', async () => {
      const ThreadModel = conn.model('thread', ThreadSchema);
      const thread = new ThreadModel({
        content: 'Hello World',
        screen_name: 'Fernando Britto',
      });
      await thread.save();

      const tweetCreated = await ThreadModel.findById(thread._id);

      expect(tweetCreated.content).toBe('Hello World');
      expect(tweetCreated.screen_name).toBe('Fernando Britto');
    });
  });
});
