import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ThreadsModule } from './threads/threads.module';

@Module({
  imports: [ThreadsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
